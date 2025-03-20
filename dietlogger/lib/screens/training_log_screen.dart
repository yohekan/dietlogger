import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class TrainingLogScreen extends StatelessWidget {
  const TrainingLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('トレログ'),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: Text('トレーニングログの画面です')),
      bottomNavigationBar: const Footer(),
    );
  }
}
