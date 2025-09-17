import 'package:dio/dio.dart';
import 'api_client.dart';
import 'auth_interceptor.dart';

class ProductService {
  late ApiClient apiClient;
  late Dio dio;

  ProductService(String? token) {
    dio = Dio();
    dio.interceptors.add(AuthInterceptor(token));
    apiClient = ApiClient(dio);
  }
}
