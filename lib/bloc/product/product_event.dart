import 'package:store_app/data/model/product/products.dart';

abstract class ProductDetailEvent {}

class ProductDetailInitializeEvent
    extends ProductDetailEvent {
  String categorysId;
  String productId;
  ProductDetailInitializeEvent(
    this.productId,
    this.categorysId,
  );
}


class ProductAddToBasket extends ProductDetailEvent {
  Products  product;
  ProductAddToBasket(this.product);
  
}
