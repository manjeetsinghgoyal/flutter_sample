import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<void> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  List<ProductModel>? _cachedProducts;

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    _cachedProducts = products;
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    if (_cachedProducts != null) {
      return _cachedProducts!;
    } else {
      throw Exception("No cached products found");
    }
  }
}
