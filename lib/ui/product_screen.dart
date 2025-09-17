import 'package:flutter/material.dart';
import '../data/api/product_service.dart';
import '../data/db/product_dao_hive.dart';
import '../data/db/product_dao_sqlite.dart';
import '../data/repository/product_repository.dart';
import '../data/models/product.dart';
import 'widgets/product_tile.dart';

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
