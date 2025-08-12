import 'package:dartz/dartz.dart';
import 'package:store_app/model/category/categorys.dart';

abstract class CategoryState {}

class InitCategoryState
    extends CategoryState {}

class CategoryLodingState
    extends CategoryState {}

class CategoryResponseState
    extends CategoryState {
  Either<String, List<Categorys>>
  responseCategory;
  CategoryResponseState(
    this.responseCategory,
  );
}
