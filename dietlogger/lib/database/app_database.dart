import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';  // ストレージへのパスを取得
import 'dart:io';
import '../models/meal_table.dart';

part 'app_database.g.dart';  // 生成コードを取り込む

@DriftDatabase(tables: [Meals])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Mealsテーブルに食事データを追加する
  Future<int> insertMeal(MealsCompanion meal) {
    return into(meals).insert(meal);
  }

  // すべての食事データを取得する
  Future<List<Meal>> getAllMeals() {
    return select(meals).get();
  }
}

// データベース接続を内部ストレージに作成
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/diet_logger.db');
    return NativeDatabase(file);
  });
}
