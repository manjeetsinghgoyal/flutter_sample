import '../models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<List<ProductModel>> getProducts();
}

class FakeProductRemoteDataSource implements ProductRemoteDataSource{
  @override
  Future<List<ProductModel>> getProducts() async{
    await Future.delayed(const Duration(seconds: 2));
    return[
      ProductModel(id: "1", name: "Laptop", price: 30000),

      ProductModel(id: "1", name: "Mobile", price: 20000),

      ProductModel(id: "1", name: "ElectricMachine", price: 50000),
    ];
  }

}