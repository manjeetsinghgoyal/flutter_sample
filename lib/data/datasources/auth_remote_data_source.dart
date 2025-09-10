import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/exceptions.dart';
import '../models/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteDataSourceImpl({required this.client});

  static const baseUrl = 'http://103.178.97.26:8070/cmgsrv2';

  @override
  Future<LoginResponseModel> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/testlogin');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return LoginResponseModel.fromJson(jsonMap);
    } else {
      throw ServerException(
        message: "Failed with status ${response.statusCode}",
        code: response.statusCode,
      );
    }
  }
}
