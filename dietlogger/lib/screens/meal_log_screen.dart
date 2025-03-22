import 'package:flutter/material.dart';
import '../database/app_database.dart';  // データベースをインポート
//import 'package:drift/native.dart';    // SQLite用
//import 'package:drift/drift.dart' as drift;
//import 'dart:io';
import '../widgets/footer.dart';
//import '../services/open_food_facts_api.dart';
import '../components/meal_list_item.dart';
import '../components/meal_filter_dialog.dart';
//import '../models/meal_table.dart';


class MealLogScreen extends StatefulWidget {
  const MealLogScreen({super.key});

  @override
  State<MealLogScreen> createState() => _MealLogScreenState();
}

class _MealLogScreenState extends State<MealLogScreen> {
  late AppDatabase _database;
  final List<Meal> _meals = [];
  bool _isLoading = false;
  int _page = 0;
  final int _limit = 20;
  late ScrollController _scrollController;
  bool _hasMore = true; // 追加: データがまだあるかのフラグ

  @override
  void initState() {
    super.initState();
    // データベースを初期化
    _database = AppDatabase();
    _scrollController = ScrollController()..addListener(_onScroll);
    _loadMeals();
  }

  // 食事データを取得する
  Future<void> _loadMeals() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);
    final db = _database;
    final newMeals = await db.mealDao.getMealsWithPagination(_page * _limit, _limit);

    if( !mounted ) return;

    setState(() {
      _meals.addAll(newMeals);
      _page++;
      _isLoading = false;
      if (newMeals.length < _limit) {
        _hasMore = false; // 追加: 20件未満の場合はこれ以上読み込まない
      }
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _loadMeals();
    }
  }

  Future<void> _deleteMeal(int id) async {
    final db = _database;
    await db.mealDao.deleteMealById(id);
    setState(() => _meals.removeWhere((meal) => meal.id == id));
  }


  @override
  void dispose() {
    _database.close();
    super.dispose();
  }


  // 食事データを追加する関数
/*  Future<void> _addMeal() async {
    final meal = MealsCompanion(
      foodName: drift.Value('サラダチキン'),
      date: drift.Value(DateTime.now()),
      mealType: drift.Value("テスト"),
      userId: drift.Value(1),
      barcode: drift.Value("1"),
      calories: drift.Value(150),
      protein: drift.Value(25.0),
      fat: drift.Value(3.0),
      carbs: drift.Value(1.0),
    );

    await _database.insertMeal(meal);
    _loadMeals();  // 再読み込み
  }

  final api = OpenFoodFactsApi();
  String result = "バーコードを読み取ってください";

  Future<void> _fetchProduct() async {
    const dummyBarcode = "3017620429484";  // ダミーのバーコード
    try {
      final product = await api.fetchProduct(dummyBarcode);
      if (product != null) {
        setState(() {
          result = '''
            商品名: ${product['product_name'] ?? '不明'}
            カロリー: ${product['nutriments']['energy-kcal_100g'] ?? '不明'} kcal/100g
            タンパク質: ${product['nutriments']['proteins_100g'] ?? '不明'} g/100g
            脂質: ${product['nutriments']['fat_100g'] ?? '不明'} g/100g
            炭水化物: ${product['nutriments']['carbohydrates_100g'] ?? '不明'} g/100g
            食塩: ${product['nutriments']['salt_100g'] ?? '不明'} g/100g
          ''';
        });
      } else {
        setState(() {
          result = "商品が見つかりませんでした";
        });
      }
    } catch (e) {
      setState(() {
        result = "エラーが発生しました: $e";
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('食事ログ'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => const MealFilterDialog(),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _meals.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _meals.length) {
            //_loadMeals();
            return const Center(child: CircularProgressIndicator());
          }
          final meal = _meals[index];
          return MealListItem(
            meal: meal,
            onTap: () {},
            onLongPress: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('削除確認'),
                content: const Text('この食事を削除しますか？'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('キャンセル'),
                  ),
                  TextButton(
                    onPressed: () {
                      _deleteMeal(meal.id);
                      Navigator.pop(context);
                    },
                    child: const Text('削除'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'addMeal',
            onPressed: () {},
            tooltip: '食事追加',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'scanBarcode',
            onPressed: () {},
            tooltip: 'バーコード読み取り',
            child: const Icon(Icons.qr_code_scanner),
          ),
        ],
      ),
/*      body: Column(
        children: [
          ElevatedButton(
            onPressed: _fetchProduct,
            child: const Text('ダミーバーコードで商品取得'),
          ),
          const SizedBox(height: 10),
          Text(result),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _addMeal,
            child: const Text('食事を追加'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _meals.length,
              itemBuilder: (context, index) {
                final meal = _meals[index];
                return ListTile(
                  title: Text(meal.foodName),
                  subtitle: Text(
                      'カロリー: ${meal.calories}kcal | P: ${meal.protein}g | F: ${meal.fat}g | C: ${meal.carbs}g'),
                );
              },
            ),
          ),
        ],
      ),*/
      bottomNavigationBar: const Footer(),
    );
  }
}
