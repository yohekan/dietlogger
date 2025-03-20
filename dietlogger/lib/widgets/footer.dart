import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFooterIcon(context, Icons.home, '/', 'ホーム'),
          _buildFooterIcon(context, Icons.chat, '/inquiry', '提案'),
          _buildFooterIcon(context, Icons.restaurant, '/meal_log', '食事ログ'),
          _buildFooterIcon(context, Icons.fitness_center, '/training_log', 'トレログ'),
          _buildFooterIcon(context, Icons.person, '/profile', 'プロフィール'),
        ],
      ),
    );
  }

  Widget _buildFooterIcon(BuildContext context, IconData icon, String route, String tooltip) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 28),
      tooltip: tooltip,
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
