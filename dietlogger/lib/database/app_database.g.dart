// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MealsTable extends Meals with TableInfo<$MealsTable, Meal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _mealTypeMeta =
      const VerificationMeta('mealType');
  @override
  late final GeneratedColumn<String> mealType = GeneratedColumn<String>(
      'meal_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _foodNameMeta =
      const VerificationMeta('foodName');
  @override
  late final GeneratedColumn<String> foodName = GeneratedColumn<String>(
      'food_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
      'calories', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _proteinMeta =
      const VerificationMeta('protein');
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
      'protein', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
      'fat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
      'carbs', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _sodiumMeta = const VerificationMeta('sodium');
  @override
  late final GeneratedColumn<double> sodium = GeneratedColumn<double>(
      'sodium', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fiberMeta = const VerificationMeta('fiber');
  @override
  late final GeneratedColumn<double> fiber = GeneratedColumn<double>(
      'fiber', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoUrlMeta =
      const VerificationMeta('photoUrl');
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
      'photo_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        mealType,
        date,
        foodName,
        calories,
        protein,
        fat,
        carbs,
        sodium,
        fiber,
        barcode,
        photoUrl,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meals';
  @override
  VerificationContext validateIntegrity(Insertable<Meal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('meal_type')) {
      context.handle(_mealTypeMeta,
          mealType.isAcceptableOrUnknown(data['meal_type']!, _mealTypeMeta));
    } else if (isInserting) {
      context.missing(_mealTypeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('food_name')) {
      context.handle(_foodNameMeta,
          foodName.isAcceptableOrUnknown(data['food_name']!, _foodNameMeta));
    } else if (isInserting) {
      context.missing(_foodNameMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(_proteinMeta,
          protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta));
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
          _fatMeta, fat.isAcceptableOrUnknown(data['fat']!, _fatMeta));
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    if (data.containsKey('carbs')) {
      context.handle(
          _carbsMeta, carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta));
    } else if (isInserting) {
      context.missing(_carbsMeta);
    }
    if (data.containsKey('sodium')) {
      context.handle(_sodiumMeta,
          sodium.isAcceptableOrUnknown(data['sodium']!, _sodiumMeta));
    }
    if (data.containsKey('fiber')) {
      context.handle(
          _fiberMeta, fiber.isAcceptableOrUnknown(data['fiber']!, _fiberMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('photo_url')) {
      context.handle(_photoUrlMeta,
          photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id']),
      mealType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_type'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      foodName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_name'])!,
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calories'])!,
      protein: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein'])!,
      fat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat'])!,
      carbs: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbs'])!,
      sodium: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sodium']),
      fiber: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fiber']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode'])!,
      photoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_url']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(attachedDatabase, alias);
  }
}

class Meal extends DataClass implements Insertable<Meal> {
  final int id;
  final int? userId;
  final String mealType;
  final DateTime date;
  final String foodName;
  final double calories;
  final double protein;
  final double fat;
  final double carbs;
  final double? sodium;
  final double? fiber;
  final String barcode;
  final String? photoUrl;
  final DateTime createdAt;
  const Meal(
      {required this.id,
      this.userId,
      required this.mealType,
      required this.date,
      required this.foodName,
      required this.calories,
      required this.protein,
      required this.fat,
      required this.carbs,
      this.sodium,
      this.fiber,
      required this.barcode,
      this.photoUrl,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    map['meal_type'] = Variable<String>(mealType);
    map['date'] = Variable<DateTime>(date);
    map['food_name'] = Variable<String>(foodName);
    map['calories'] = Variable<double>(calories);
    map['protein'] = Variable<double>(protein);
    map['fat'] = Variable<double>(fat);
    map['carbs'] = Variable<double>(carbs);
    if (!nullToAbsent || sodium != null) {
      map['sodium'] = Variable<double>(sodium);
    }
    if (!nullToAbsent || fiber != null) {
      map['fiber'] = Variable<double>(fiber);
    }
    map['barcode'] = Variable<String>(barcode);
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MealsCompanion toCompanion(bool nullToAbsent) {
    return MealsCompanion(
      id: Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      mealType: Value(mealType),
      date: Value(date),
      foodName: Value(foodName),
      calories: Value(calories),
      protein: Value(protein),
      fat: Value(fat),
      carbs: Value(carbs),
      sodium:
          sodium == null && nullToAbsent ? const Value.absent() : Value(sodium),
      fiber:
          fiber == null && nullToAbsent ? const Value.absent() : Value(fiber),
      barcode: Value(barcode),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
      createdAt: Value(createdAt),
    );
  }

  factory Meal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meal(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      mealType: serializer.fromJson<String>(json['mealType']),
      date: serializer.fromJson<DateTime>(json['date']),
      foodName: serializer.fromJson<String>(json['foodName']),
      calories: serializer.fromJson<double>(json['calories']),
      protein: serializer.fromJson<double>(json['protein']),
      fat: serializer.fromJson<double>(json['fat']),
      carbs: serializer.fromJson<double>(json['carbs']),
      sodium: serializer.fromJson<double?>(json['sodium']),
      fiber: serializer.fromJson<double?>(json['fiber']),
      barcode: serializer.fromJson<String>(json['barcode']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int?>(userId),
      'mealType': serializer.toJson<String>(mealType),
      'date': serializer.toJson<DateTime>(date),
      'foodName': serializer.toJson<String>(foodName),
      'calories': serializer.toJson<double>(calories),
      'protein': serializer.toJson<double>(protein),
      'fat': serializer.toJson<double>(fat),
      'carbs': serializer.toJson<double>(carbs),
      'sodium': serializer.toJson<double?>(sodium),
      'fiber': serializer.toJson<double?>(fiber),
      'barcode': serializer.toJson<String>(barcode),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Meal copyWith(
          {int? id,
          Value<int?> userId = const Value.absent(),
          String? mealType,
          DateTime? date,
          String? foodName,
          double? calories,
          double? protein,
          double? fat,
          double? carbs,
          Value<double?> sodium = const Value.absent(),
          Value<double?> fiber = const Value.absent(),
          String? barcode,
          Value<String?> photoUrl = const Value.absent(),
          DateTime? createdAt}) =>
      Meal(
        id: id ?? this.id,
        userId: userId.present ? userId.value : this.userId,
        mealType: mealType ?? this.mealType,
        date: date ?? this.date,
        foodName: foodName ?? this.foodName,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        carbs: carbs ?? this.carbs,
        sodium: sodium.present ? sodium.value : this.sodium,
        fiber: fiber.present ? fiber.value : this.fiber,
        barcode: barcode ?? this.barcode,
        photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('mealType: $mealType, ')
          ..write('date: $date, ')
          ..write('foodName: $foodName, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('sodium: $sodium, ')
          ..write('fiber: $fiber, ')
          ..write('barcode: $barcode, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      mealType,
      date,
      foodName,
      calories,
      protein,
      fat,
      carbs,
      sodium,
      fiber,
      barcode,
      photoUrl,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.mealType == this.mealType &&
          other.date == this.date &&
          other.foodName == this.foodName &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.fat == this.fat &&
          other.carbs == this.carbs &&
          other.sodium == this.sodium &&
          other.fiber == this.fiber &&
          other.barcode == this.barcode &&
          other.photoUrl == this.photoUrl &&
          other.createdAt == this.createdAt);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<int> id;
  final Value<int?> userId;
  final Value<String> mealType;
  final Value<DateTime> date;
  final Value<String> foodName;
  final Value<double> calories;
  final Value<double> protein;
  final Value<double> fat;
  final Value<double> carbs;
  final Value<double?> sodium;
  final Value<double?> fiber;
  final Value<String> barcode;
  final Value<String?> photoUrl;
  final Value<DateTime> createdAt;
  const MealsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.mealType = const Value.absent(),
    this.date = const Value.absent(),
    this.foodName = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.sodium = const Value.absent(),
    this.fiber = const Value.absent(),
    this.barcode = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MealsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String mealType,
    required DateTime date,
    required String foodName,
    required double calories,
    required double protein,
    required double fat,
    required double carbs,
    this.sodium = const Value.absent(),
    this.fiber = const Value.absent(),
    required String barcode,
    this.photoUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : mealType = Value(mealType),
        date = Value(date),
        foodName = Value(foodName),
        calories = Value(calories),
        protein = Value(protein),
        fat = Value(fat),
        carbs = Value(carbs),
        barcode = Value(barcode);
  static Insertable<Meal> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? mealType,
    Expression<DateTime>? date,
    Expression<String>? foodName,
    Expression<double>? calories,
    Expression<double>? protein,
    Expression<double>? fat,
    Expression<double>? carbs,
    Expression<double>? sodium,
    Expression<double>? fiber,
    Expression<String>? barcode,
    Expression<String>? photoUrl,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (mealType != null) 'meal_type': mealType,
      if (date != null) 'date': date,
      if (foodName != null) 'food_name': foodName,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (fat != null) 'fat': fat,
      if (carbs != null) 'carbs': carbs,
      if (sodium != null) 'sodium': sodium,
      if (fiber != null) 'fiber': fiber,
      if (barcode != null) 'barcode': barcode,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MealsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? userId,
      Value<String>? mealType,
      Value<DateTime>? date,
      Value<String>? foodName,
      Value<double>? calories,
      Value<double>? protein,
      Value<double>? fat,
      Value<double>? carbs,
      Value<double?>? sodium,
      Value<double?>? fiber,
      Value<String>? barcode,
      Value<String?>? photoUrl,
      Value<DateTime>? createdAt}) {
    return MealsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      mealType: mealType ?? this.mealType,
      date: date ?? this.date,
      foodName: foodName ?? this.foodName,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      sodium: sodium ?? this.sodium,
      fiber: fiber ?? this.fiber,
      barcode: barcode ?? this.barcode,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (foodName.present) {
      map['food_name'] = Variable<String>(foodName.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (sodium.present) {
      map['sodium'] = Variable<double>(sodium.value);
    }
    if (fiber.present) {
      map['fiber'] = Variable<double>(fiber.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('mealType: $mealType, ')
          ..write('date: $date, ')
          ..write('foodName: $foodName, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('sodium: $sodium, ')
          ..write('fiber: $fiber, ')
          ..write('barcode: $barcode, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MealsTable meals = $MealsTable(this);
  late final MealDao mealDao = MealDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [meals];
}
