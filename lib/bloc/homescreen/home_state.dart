import 'package:dartz/dartz.dart';
import 'package:store_app/model/banner/banners.dart';
import 'package:store_app/model/category/categorys.dart';

abstract class HomeState {}

class IHomeState extends HomeState {}

class HomeLodingState extends HomeState {}

class HomeBannerResponseState
    extends HomeState {
  Either<String, List<Banners>>
  responseHomeBanner;
  HomeBannerResponseState(
    this.responseHomeBanner,
  );
}

class HomeCategoryResponseState
    extends HomeState {
  Either<String, List<Categorys>>
  responseHomeCategory;
  HomeCategoryResponseState(
    this.responseHomeCategory,
  );
}
