import 'package:drift/drift.dart';

@DataClassName('Meal')
class Meals extends Table {
  IntColumn get id => integer().autoIncrement()();
  //IntColumn get userId => integer().customConstraint('REFERENCES users(id)')();
  IntColumn get userId => integer().nullable()();
  TextColumn get mealType => text().withLength(min: 1, max: 10)(); // 朝食、昼食、夕食など
  DateTimeColumn get date => dateTime()(); // 食事の日時
  TextColumn get foodName => text().withLength(min: 1, max: 100)(); // 食品名
  RealColumn get calories => real()(); // カロリー
  RealColumn get protein => real()(); // タンパク質
  RealColumn get fat => real()(); // 脂質
  RealColumn get carbs => real()(); // 炭水化物
  RealColumn get sodium => real().nullable()();  // 食塩（ナトリウム）
  RealColumn get fiber => real().nullable()();  // 食物繊維
  TextColumn get barcode => text()();  // バーコード番号
  TextColumn get photoUrl => text().nullable()(); // 製品の画像URL
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)(); // 作成日時
}
