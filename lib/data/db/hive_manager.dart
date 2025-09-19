import 'package:chat/data/models/user.dart';
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
  static Box<User> getUsersBox() => Hive.box<User>(usersBox);
/*

  usersBox.put('username',"manjeet");
  usersBox.get("username");
  usersBox.delete("username");

  Hive -- lightweight ,nosql
  box --- table(hive)/collection/key-value pair,
  Hivemanager --- class to manage boxes, CRUD
  */


}
