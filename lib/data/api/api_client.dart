import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/product.dart';
import '../models/user.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://example.com/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/login")
  Future<User> login(@Body() Map<String, dynamic> body);

  @GET("/products")
  Future<List<Product>> getProducts();
}
