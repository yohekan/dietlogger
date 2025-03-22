import 'package:flutter/material.dart';

class MealFilterDialog extends StatefulWidget {
  const MealFilterDialog({Key? key}) : super(key: key);

  @override
  State<MealFilterDialog> createState() => _MealFilterDialogState();
}

class _MealFilterDialogState extends State<MealFilterDialog> {
  String _keyword = '';
  double? _minCalories;
  double? _maxCalories;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('フィルタ'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'キーワード'),
            onChanged: (value) => setState(() => _keyword = value),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: '最小カロリー'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _minCalories = double.tryParse(value),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: '最大カロリー'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _maxCalories = double.tryParse(value),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            // TODO: フィルタ処理の実装
            Navigator.pop(context);
          },
          child: const Text('適用'),
        ),
      ],
    );
  }
}
