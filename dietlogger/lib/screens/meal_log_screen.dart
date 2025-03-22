import 'package:flutter/material.dart';
import '../database/app_database.dart';  // データベースをインポート
//import 'package:drift/native.dart';    // SQLite用
import 'package:drift/drift.dart' as drift;
//import 'dart:io';
import '../widgets/footer.dart';
import '../services/open_food_facts_api.dart';

class MealLogScreen extends StatefulWidget {
  const MealLogScreen({super.key});

  @override
  State<MealLogScreen> createState() => _MealLogScreenState();
}

class _MealLogScreenState extends State<MealLogScreen> {
  late AppDatabase _database;
  List<Meal> _meals = [];

  @override
  void initState() {
    super.initState();
    // データベースを初期化
    _database = AppDatabase();
    _loadMeals();  // 初回読み込み
  }

  // 食事データを取得する
  Future<void> _loadMeals() async {
    final meals = await _database.getAllMeals();
    setState(() {
      _meals = meals;
    });
  }

  // 食事データを追加する関数
  Future<void> _addMeal() async {
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

  @override
  void dispose() {
    _database.close();
    super.dispose();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('食事ログ'),
        backgroundColor: Colors.green,
      ),
      body: Column(
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
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
