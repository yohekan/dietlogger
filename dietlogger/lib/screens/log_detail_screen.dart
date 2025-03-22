import 'package:flutter/material.dart';

class LogDetailScreen extends StatelessWidget {
  final String date;

  const LogDetailScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$dateの記録')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('🥗 食事記録', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('サラダチキン & おにぎり'),
              subtitle: const Text('カロリー: 400kcal / P: 30g / F: 5g / C: 40g'),
            ),
            ListTile(
              title: const Text('プロテインバー'),
              subtitle: const Text('カロリー: 200kcal / P: 15g / F: 8g / C: 20g'),
            ),
            const Divider(),
            const Text('🔥 トレーニング記録', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('自重スクワット'),
              subtitle: const Text('3セット x 15回 / 消費カロリー: 100kcal'),
            ),
            ListTile(
              title: const Text('プッシュアップ'),
              subtitle: const Text('3セット x 12回 / 消費カロリー: 150kcal'),
            ),
          ],
        ),
      ),
    );
  }
}
