
import 'package:chat/features/product/domain/entities/product.dart';

abstract class ProductEvent{}

class LoadProducts extends ProductEvent{}

class AddToCartEvent extends ProductEvent{
  final Product product;
  AddToCartEvent(this.product);
}

class RemoveFromCartEvent extends ProductEvent{
  final Product product;
  RemoveFromCartEvent(this.product);
}