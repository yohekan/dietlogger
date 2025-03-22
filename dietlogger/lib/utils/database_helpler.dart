import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//import '../app_database.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'app_database.db');
    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  // データベース作成時にテーブルを作成
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meals(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER,
        mealType TEXT,
        date TEXT,
        foodName TEXT,
        calories REAL,
        protein REAL,
        fat REAL,
        carbs REAL,
        sodium REAL,
        fiber REAL,
        barcode TEXT,
        photoUrl TEXT,
        createdAt TEXT
      )
    ''');
  }
}
