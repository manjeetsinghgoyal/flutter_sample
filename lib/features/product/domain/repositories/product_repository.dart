import '../entities/product.dart';

abstract class ProductRepository{

  Future<List<Product>> fetchProducts();

  Future<void> addToCart(Product product);

  Future<void> removeFromCart(Product product);

  Future<List<Product>> getCartProducts();

  Future<Map<String, int>> getCartQuantities();

}