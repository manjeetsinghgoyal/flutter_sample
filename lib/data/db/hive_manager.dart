import 'package:hive/hive.dart';
import '../models/product.dart';

class HiveManager {
  static const String productBox = 'productBox';

  static Future<void> init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ProductAdapter());
    }
    await Hive.openBox<Product>(productBox);
  }

  static Box<Product> getProductsBox() => Hive.box<Product>(productBox);
}
