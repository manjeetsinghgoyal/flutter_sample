abstract class AuthRepository {
  Future<bool> login(String userName, String password);
}

class FakeAuthRepository implements AuthRepository {
  @override
  Future<bool> login(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return userName == "flutter" && password == "flutter";
  }
}
