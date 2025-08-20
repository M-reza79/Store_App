import 'package:dartz/dartz.dart';
import 'package:store_app/data/model/gallery/product_image.dart';
import 'package:store_app/data/model/product_variant/product_variant.dart';
import 'package:store_app/data/model/variants_type/variants_types.dart';

abstract class ProductDetailState {}

class ProductDetailInitstate
    extends ProductDetailState {}

class ProductDetailLodingState
    extends ProductDetailState {}

class ProductDetailResponseState
    extends ProductDetailState {
  Either<String, List<ProductImage>>
  responseProductImage;
  Either<String, List<ProductVariant>>
  responseProductVariant;

  ProductDetailResponseState(
    this.responseProductImage,
    this.responseProductVariant,
  );
}
