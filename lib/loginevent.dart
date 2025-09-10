//Bloc Event
abstract class LoginEvent{}

class LoginButtonPressed extends LoginEvent{
  final String username;
  final String password;
  LoginButtonPressed(this.username,this.password);
}