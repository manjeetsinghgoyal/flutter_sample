import '../api/product_service.dart';
import '../models/product.dart';
import '../db/product_dao.dart';

class ProductRepository {
  final ProductService service;
  final ProductDao dao;
  ProductRepository(this.service, this.dao);

  Future<List<Product>> getProducts() async {
    try {
      //api call jo fetch products from cloud or api
      final products = await service.apiClient.getProducts();
      //write those products into our hive box / sqflite db table
      await dao.insertProducts(products);
      //this is to show over Ui on the same time
      return products;
    } catch (e) {
      return await dao.getProducts();
    }
  }
}
