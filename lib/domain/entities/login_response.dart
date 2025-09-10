class LoginResponse {
  final String message;
  final String status;
  final List<dynamic> data;
  LoginResponse({required this.message, required this.status, required this.data});
}