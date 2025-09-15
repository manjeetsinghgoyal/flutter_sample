import 'package:chat/features/product/presentation/bloc/product_bloc.dart';
import 'package:chat/features/product/presentation/bloc/product_event.dart';
import 'package:chat/features/product/presentation/bloc/product_state.dart';
import 'package:chat/features/product/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Catalog"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<ProductBloc>(), // same bloc share
                    child: const CartPage(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(child: Text("Error: ${state.error}"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (_, index) {
                    final product = state.products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text("${product.price}"),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<ProductBloc>().add(AddToCartEvent(product));
                        },
                        icon: const Icon(Icons.add_shopping_cart),
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(15),
                child: Text("Cart items: ${state.cart.length}"),
              ),
            ],
          );
        },
      ),
    );
  }
}
