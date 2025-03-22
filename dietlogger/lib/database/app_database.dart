import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';  // ストレージへのパスを取得
import 'dart:io';
import '../models/meal_table.dart';

part 'app_database.g.dart';  // 生成コードを取り込む

@DriftDatabase(tables: [Meals], daos: [MealDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// データベース接続を内部ストレージに作成
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/diet_logger.db');
    return NativeDatabase(file);
  });
}
