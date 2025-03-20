import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class InquiryScreen extends StatelessWidget {
  const InquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提案'),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: Text('提案の画面です')),
      bottomNavigationBar: const Footer(),
    );
  }
}
