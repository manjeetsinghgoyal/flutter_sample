import '../models/product.dart';

abstract class ProductDao {
  Future<void> insertProducts(List<Product> products);
  Future<List<Product>> getProducts();
}
