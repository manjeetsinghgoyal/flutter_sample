// Repository api call 
class LoginRepository{
  Future<bool> login(String username, String password) async{
    await Future.delayed(const Duration(seconds: 5));

    if(username == "flutter" && password == "flutter"){
      return true;// login success
    }
    else{
      throw Exception("Invalid user");
    }
  }
}