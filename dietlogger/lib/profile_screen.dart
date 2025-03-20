import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('プロフィール')),
      body: const Center(
        child: Text('身長: 175cm\n体重: 70kg\n目標体重: 65kg'),
      ),
    );
  }
}
