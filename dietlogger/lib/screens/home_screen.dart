import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/footer.dart';

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
                    PieChartSectionData(value: 50, title: 'Protein', color: Colors.blue, radius: 60),
                    PieChartSectionData(value: 30, title: 'Fat', color: Colors.orange, radius: 50),
                    PieChartSectionData(value: 20, title: 'Carbs', color: Colors.green, radius: 40),
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
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),  // フッターを追加
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
}
