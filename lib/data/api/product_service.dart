import 'mock_api_client.dart';
import '../models/product.dart';

/*

class ProductService {
  late ApiClient apiClient;
  late Dio dio;

  ProductService(String? token) {
    dio = Dio();
    dio.interceptors.add(AuthInterceptor(token));
    apiClient = ApiClient(dio);
  }

}
*/

class ProductService {
  late MockApiClient apiClient;

  ProductService({bool useMock = true}) {
    apiClient = MockApiClient(); // always mock abhi
  }

  Future<bool> login(String username, String password) {
    return apiClient.login(username, password);
  }

  Future<List<Product>> getProducts() {
    return apiClient.getProducts();
  }
}

