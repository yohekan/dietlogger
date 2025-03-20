import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/inquiry_screen.dart';
import 'screens/meal_log_screen.dart';
import 'screens/training_log_screen.dart';
import 'screens/profile_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ダイエットアプリ',
      theme: ThemeData(primarySwatch: Colors.green),
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
