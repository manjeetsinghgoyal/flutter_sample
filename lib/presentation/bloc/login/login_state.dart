import 'package:equatable/equatable.dart';


enum FormStatus { initial, valid, invalid, submitting, success, failure }


class LoginState extends Equatable {
  final String username;
  final String password;
  final FormStatus status;
  final String? message;


  LoginState({this.username = '', this.password = '', this.status = FormStatus.initial, this.message});


  LoginState copyWith({String? username, String? password, FormStatus? status, String? message}) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }


  @override
  List<Object?> get props => [username, password, status, message];
}