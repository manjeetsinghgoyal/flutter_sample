part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {

  final String userName;
  final String password;

  LoginButtonPressed(this.userName, this.password);
}
