import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class InquiryScreen extends StatefulWidget {
  const InquiryScreen({super.key});

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage(String text) {
    if (text.isEmpty) return;
    setState(() {
      _messages.add({'user': text});
      _messages.add({'ai': '提案：$text に合う食事プランを表示します。'});
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('問い合わせと提案')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var message = _messages[index];
                bool isUser = message.containsKey('user');

                return ChatBubble(
                  alignment: isUser ? Alignment.topRight : Alignment.topLeft,
                  clipper: ChatBubbleClipper5(type: isUser ? BubbleType.sendBubble : BubbleType.receiverBubble),
                  backGroundColor: isUser ? Colors.green : Colors.grey[300],
                  child: Text(
                    isUser ? message['user']! : message['ai']!,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: '質問を入力...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
