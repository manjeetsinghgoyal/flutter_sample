import '../models/product.dart';

class MockApiClient {
  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate delay
    return username == "manjeet" && password == "1234";
  }

  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Product(id: 1, name: "Laptop", price: 55000),
      Product(id: 2, name: "Phone", price: 25000),
      Product(id: 3, name: "Headphones", price: 2000),
    ];
  }
}
