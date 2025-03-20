import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: Text('プロフィール画面です')),
      bottomNavigationBar: const Footer(),
    );
  }
}
