import 'package:flutter/material.dart';
import '../database/app_database.dart';
import 'package:intl/intl.dart';

class MealListItem extends StatelessWidget {
  final Meal meal;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const MealListItem({
    Key? key,
    required this.meal,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);

// 日付を指定の形式でフォーマット
  String formatDate(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        title: Text(meal.foodName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('P: ${meal.protein}g, F: ${meal.fat}g, C: ${meal.carbs}g'),
            SizedBox(height: 4),
            Text('日付: ${formatDate(meal.date)}'),
            Text('内訳: ${meal.mealType}'),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        title: Text(meal.foodName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('P: ${meal.protein}g, F: ${meal.fat}g, C: ${meal.carbs}g'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
*/
}
