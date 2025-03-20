import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class MealLogScreen extends StatelessWidget {
  const MealLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('食事ログ'),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: Text('食事ログの画面です')),
      bottomNavigationBar: const Footer(),
    );
  }
}
