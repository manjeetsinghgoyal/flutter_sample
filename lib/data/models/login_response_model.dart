import '../../domain/entities/login_response.dart';


class LoginResponseModel extends LoginResponse {
  LoginResponseModel({required super.message, required super.status, required super.data});


  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['Message'] ?? '',
      status: json['Status'] ?? '',
      data: json['Data'] ?? [],
    );
  }
}