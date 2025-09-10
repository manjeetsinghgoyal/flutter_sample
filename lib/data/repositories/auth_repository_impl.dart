import '../../core/exceptions.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/repositories/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  AuthRepositoryImpl({required this.remote});


  @override
  Future<LoginResponse> login(String username, String password) async {
    try {
      final resp = await remote.login(username, password);
      return resp;
    } catch (e) {
// Map errors
      if (e is ServerException) rethrow;
      throw ServerException(message: e.toString());
    }
  }
}