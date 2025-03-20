import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('今日の概要',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // PFCバランスグラフ
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 50, title: 'Protein', color: Colors.blue, radius: 60),
                    PieChartSectionData(
                      value: 30, title: 'Fat', color: Colors.orange, radius: 50),
                    PieChartSectionData(
                      value: 20, title: 'Carbs', color: Colors.green, radius: 40),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // カロリー表示
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('摂取カロリー', '1800 kcal', Colors.red),
                _buildStatCard('消費カロリー', '500 kcal', Colors.blue),
              ],
            ),
            const SizedBox(height: 16),

            // ショートカットボタン
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShortcutButton(context, Icons.chat, '提案', '/inquiry'),
                _buildShortcutButton(context, Icons.restaurant, '食事ログ', '/meal_log'),
                _buildShortcutButton(context, Icons.fitness_center, 'トレログ', '/training_log'),
                _buildShortcutButton(context, Icons.person, 'プロフィール', '/profile'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildShortcutButton(BuildContext context, IconData icon, String label, String route) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.pushNamed(context, route),
      icon: Icon(icon, size: 24),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
