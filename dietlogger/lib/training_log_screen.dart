import 'package:flutter/material.dart';

class TrainingLogScreen extends StatelessWidget {
  const TrainingLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('トレーニングログ')),
      body: const Center(
        child: Text('トレーニングログ画面'),
      ),
    );
  }
}
