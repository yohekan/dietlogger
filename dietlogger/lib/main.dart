import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'inquiry_screen.dart';
import 'meal_log_screen.dart';
import 'training_log_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ダイエットアプリ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/inquiry': (context) => const InquiryScreen(),
        '/meal_log': (context) => const MealLogScreen(),
        '/training_log': (context) => const TrainingLogScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
