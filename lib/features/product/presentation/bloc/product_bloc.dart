import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat/features/product/domain/repositories/product_repository.dart';
import 'package:chat/features/product/presentation/bloc/product_event.dart';
import 'package:chat/features/product/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductState()){
    on<LoadProducts>((event,emit) async {
      emit(state.copyWith(loading: true));
      try{
        final products = await productRepository.fetchProducts();
        emit(state.copyWith(products: products, loading: false));
      }
      catch(e){
        emit(state.copyWith(loading: false, error: e.toString()));
      }
    });

    on<AddToCartEvent>((event,emit) async {
      await productRepository.addToCart(event.product);
      final cart = await productRepository.getCartProducts();
      emit(state.copyWith(cart: cart));
    });

    on<RemoveFromCartEvent>((event,emit) async {
      await productRepository.removeFromCart(event.product);
      final cart = await productRepository.getCartProducts();
      emit(state.copyWith(cart: cart));
    });

  }

}