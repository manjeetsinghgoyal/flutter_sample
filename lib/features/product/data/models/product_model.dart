import '../../domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({required String id, required String  name, required double price})
  :super(id:id, name: name,price: price);

  factory ProductModel.fromJson(Map<String,dynamic>json){
    return ProductModel(id: json["id"], name: json["name"], price: json["price"]);
  }

  Map<String,dynamic> toJson() => {'id':id,'name':name,'price':price};
}