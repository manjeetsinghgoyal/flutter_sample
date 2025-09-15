import 'package:chat/features/product/presentation/bloc/product_bloc.dart';
import 'package:chat/features/product/presentation/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.cart.isEmpty) {
            return const Center(child: Text("Cart is empty"));
          }
          return ListView.builder(
            itemCount: state.cart.length,
            itemBuilder: (_, index) {
              final product = state.cart[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text("${product.price}"),
              );
            },
          );
        },
      ),
    );
  }
}
