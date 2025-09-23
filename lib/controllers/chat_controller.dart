import '../event_bus.dart';
import '../events.dart';

class ChatController {
  void sendMessage(String message) {
    if (message.isNotEmpty) {
      eventBus.fire(NewMessageEvent(message));
    }
  }
}
