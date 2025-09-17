import '../api/product_service.dart';
import '../models/product.dart';
import '../db/product_dao.dart';

class ProductRepository {
  final ProductService service;
  final ProductDao dao;
  ProductRepository(this.service, this.dao);

  Future<List<Product>> getProducts() async {
    try {
      final products = await service.apiClient.getProducts();
      await dao.insertProducts(products);
      return products;
    } catch (e) {
      return await dao.getProducts();
    }
  }
}
