import 'package:dartz/dartz.dart';
import 'package:store_app/data/model/category/categorys.dart';
import 'package:store_app/data/model/gallery/product_image.dart';
import 'package:store_app/data/model/product_variant/product_variant.dart';
import 'package:store_app/data/model/properties/properties.dart';
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
  Either<String, Categorys> responsecategorysId;
  Either<String, List<Properties>>
  responseProductProperties;
  ProductDetailResponseState(
    this.responseProductImage,
    this.responseProductVariant,
    this.responsecategorysId,
    this.responseProductProperties,
  );
}
