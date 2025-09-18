import 'package:flutter/material.dart';
import '../data/api/product_service.dart';
import '../data/models/product.dart';

class ProductScreen extends StatefulWidget {
  final ProductService service;
  const ProductScreen({super.key, required this.service});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products = widget.service.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading products"));
          }
          final products = snapshot.data ?? [];
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text("₹${product.price.toStringAsFixed(2)}"),
              );
            },
          );
        },
      ),
    );
  }
}

/*
class ProductScreen extends StatefulWidget {
  final String token;
  final bool useHive;
  const ProductScreen({super.key, required this.token, this.useHive = true});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductRepository repo;
  List<Product> products = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    final dao = widget.useHive ? ProductDaoHive() : ProductDaoSqlite();
    repo = ProductRepository(ProductService(widget.token), dao);
    loadProducts();
  }

  Future<void> loadProducts() async {
    setState(() => loading = true);
    final data = await repo.getProducts();
    setState(() {
      products = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.useHive ? 'Products (Hive)' : 'Products (SQLite)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            onPressed: () {
              // swap DB type by restarting this screen with other flag
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProductScreen(token: widget.token, useHive: !widget.useHive)));
            },
            tooltip: 'Switch DB',
          )
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadProducts,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, idx) => ProductTile(product: products[idx]),
              ),
            ),
    );
  }
}
*/
