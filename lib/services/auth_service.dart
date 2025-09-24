
class AuthService{
  Future<bool> login(String email, String password) async{
    await Future.delayed(const Duration(microseconds: 200));
    if(email == 'man@gmail.com' && password == '123456'){
      return true;
    }
    return false;
  }
}