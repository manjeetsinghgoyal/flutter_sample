import 'package:chat/features/product/domain/entities/product.dart';

class ProductState {
  final List<Product> products;
  final List<Product> cart;
  final Map<String, int> cartQuantities;
  final bool loading;
  final String? error;

  ProductState({
    this.products = const [],
    this.cart = const [],
    this.cartQuantities= const{},
    this.loading = false,
    this.error,
  });

  ProductState copyWith({
    List<Product>? products,
    List<Product>? cart,
    Map<String,int>> cartQuantities,
    bool? loading,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      cart: cart ?? this.cart,
      cartQuantities: cartQuantities ?? this.cartQuantities,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}
