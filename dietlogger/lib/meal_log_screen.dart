import 'package:flutter/material.dart';

class MealLogScreen extends StatelessWidget {
  const MealLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('食事ログ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('写真をアップロード'),
            IconButton(
              icon: const Icon(Icons.camera_alt, size: 50),
              onPressed: () {
                // 画像アップロード処理
              },
            ),
            const Text('カレンダーで履歴表示')
          ],
        ),
      ),
    );
  }
}
