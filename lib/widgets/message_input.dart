import 'package:flutter/material.dart';
import '../controllers/chat_controller.dart';

class MessageInput extends StatefulWidget {
  final ChatController controller;
  MessageInput({required this.controller});

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();

  void _send() {
    widget.controller.sendMessage(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Type a message'),
            ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: _send),
        ],
      ),
    );
  }
}
