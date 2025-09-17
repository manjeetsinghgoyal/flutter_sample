import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'product_dao.dart';
import '../models/product.dart';

class ProductDaoSqlite implements ProductDao {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'products.db');
    return await openDatabase(path, version: 1, onCreate: (db, v) async {
      await db.execute('''
        CREATE TABLE products(
          id INTEGER PRIMARY KEY,
          name TEXT,
          price REAL
        )
      ''');
    });
  }

  @override
  Future<void> insertProducts(List<Product> products) async {
    final db = await database;
    final batch = db.batch();
    for (var p in products) {
      batch.insert('products', {'id': p.id, 'name': p.name, 'price': p.price},
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  @override
  Future<List<Product>> getProducts() async {
    final db = await database;
    final maps = await db.query('products');
    return maps.map((e) => Product(id: e['id'] as int, name: e['name'] as String, price: (e['price'] as num).toDouble())).toList();
  }
}
