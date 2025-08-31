import 'package:dartz/dartz.dart';
import 'package:store_app/data/model/banner/banners.dart';
import 'package:store_app/data/model/category/categorys.dart';
import 'package:store_app/data/model/product/products.dart';

abstract class HomeState {}

class IHomeState extends HomeState {}

class HomeLodingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<Banners>>
  responseHomebaanner;
  Either<String, List<Categorys>>
  responseHomeCategory;
  Either<String, List<Products>>
  responseHomeProducts;
  Either<String, List<Products>>
  responseHomeHotestProducts;
  Either<String, List<Products>>
  responseHomeBestSellerProducts;
  HomeResponseState(
    this.responseHomebaanner,
    this.responseHomeCategory,
    this.responseHomeProducts,
    this.responseHomeHotestProducts,
    this.responseHomeBestSellerProducts,
  );
}
