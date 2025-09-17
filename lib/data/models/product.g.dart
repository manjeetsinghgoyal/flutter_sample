// GENERATED CODE - placeholder
part of 'product.dart';

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['id'] as int,
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
};

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;
  @override
  Product read(BinaryReader reader) {
    final id = reader.read() as int;
    final name = reader.read() as String;
    final price = reader.read() as double;
    return Product(id: id, name: name, price: price);
  }
  @override
  void write(BinaryWriter writer, Product obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.price);
  }
}
