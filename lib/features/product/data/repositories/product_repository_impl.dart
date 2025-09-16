import 'package:chat/features/product/data/datasources/product_remote_data_source.dart';
import 'package:chat/features/product/domain/entities/product.dart';
import 'package:chat/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  late final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl(this.productRemoteDataSource);

  final Map<String, int> cart = {}; // productId -> quantity
  final Map<String, Product> cartProducts = {}; // productId -> product
  @override
  Future<void> addToCart(Product product) async {
    if (cart.containsKey(product.id)) {
      cart[product.id] = cart[product.id]! + 1;
    } else {
      cart[product.id] = 1;
      cartProducts[product.id] = product;
    }
  }

  @override
  Future<void> removeFromCart(Product product) async {
    if (cart.containsKey(product.id)) {
      if (cart[product.id]! > 1) {
        cart[product.id] = cart[product.id]! - 1;
      } else {
        cart.remove(product.id);
        cartProducts.remove(product.id);
      }
    }
  }

  @override
  Future<List<Product>> getCartProducts() async {
    return cartProducts.values.toList();
  }

  Future<Map<String, int>> getCartQuantities() async {
    return cart;
  }

  @override
  Future<List<Product>> fetchProducts() async {
    return await productRemoteDataSource.getProducts();
  }
}