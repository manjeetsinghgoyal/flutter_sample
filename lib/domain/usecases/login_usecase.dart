import '../repositories/auth_repository.dart';
import '../entities/login_response.dart';


class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase({required this.repository});


  Future<LoginResponse> call(String username, String password) async {
    return await repository.login(username, password);
  }
}