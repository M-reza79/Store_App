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
