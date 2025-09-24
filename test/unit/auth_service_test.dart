import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_event_bus_chat/services/auth_service.dart';

void main() {
  late AuthService authService;
  setUp(() {
    authService = AuthService();
  });


  test('returns true for valid credentials'() async{
  final result = await authService.login('man@gmail.com','123456');
  expect(result, true)
  });

  test('returns false for invalid credentials'() async{
  final result = await authService.login('test@gmail.com','654321');
  expect(result, false)
  });
}