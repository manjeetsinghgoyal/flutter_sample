import 'product_dao.dart';
import 'hive_manager.dart';
import '../models/product.dart';

class ProductDaoHive implements ProductDao {
  final _box = HiveManager.getProductsBox();
  @override
  Future<void> insertProducts(List<Product> products) async {
    for (var p in products) {
      _box.put(p.id, p);
    }
  }

  @override
  Future<List<Product>> getProducts() async {
    return _box.values.toList();
  }
}
