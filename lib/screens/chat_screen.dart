import 'package:flutter/material.dart';
import '../event_bus.dart';
import '../events.dart';
import '../widgets/message_input.dart';
import '../controllers/chat_controller.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  late final _subscription;
  final ChatController _controller = ChatController();

  @override
  void initState() {
    super.initState();
    _subscription = eventBus.on<NewMessageEvent>().listen((event) {
      setState(() {
        messages.add(event.message);
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Bus Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(messages[index]),
              ),
            ),
          ),
          MessageInput(controller: _controller),
        ],
      ),
    );
  }
}
