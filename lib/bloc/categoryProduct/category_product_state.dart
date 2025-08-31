import 'package:dartz/dartz.dart';
import 'package:store_app/data/model/product/products.dart';

abstract class CategoryProductState {}

class CategoryProductInitializeState
    extends CategoryProductState {}

class CategoryProductLodingState
    extends CategoryProductState {}

class CategoryProductResponseState
    extends CategoryProductState {
  Either<String, List<Products>>
  productListCategory;
  CategoryProductResponseState(
    this.productListCategory,
  );
}
