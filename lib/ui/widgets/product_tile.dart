import 'package:flutter/material.dart';
import '../../data/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('₹\${product.price.toStringAsFixed(2)}'),
    );
  }
}
