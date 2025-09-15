import 'package:chat/features/product/data/datasources/product_remote_data_source.dart';
import 'package:chat/features/product/domain/entities/product.dart';
import 'package:chat/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  late final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl(this.productRemoteDataSource);

  final List<Product> cart = [];

  @override
  Future<void> addToCart(Product product) async {
    cart.add(product);
  }

  @override
  Future<List<Product>> fetchProducts() async {
    return await productRemoteDataSource.getProducts();
  }

  @override
  Future<List<Product>> getCartProducts() async {
    return cart;
  }

  @override
  Future<void> removeFromCart(Product product) async {
    cart.removeWhere((p) => p.id == product.id);
  }
}
