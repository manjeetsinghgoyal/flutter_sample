import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String? token;
  AuthInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (token != null && token!.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer \$token';
    }
    return handler.next(options);
  }
}
