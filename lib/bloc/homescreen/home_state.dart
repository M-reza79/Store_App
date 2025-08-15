import 'package:dartz/dartz.dart';
import 'package:store_app/model/banner/banners.dart';
import 'package:store_app/model/category/categorys.dart';

abstract class HomeState {}

class IHomeState extends HomeState {}

class HomeLodingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<Banners>>
  responseHomebaanner;
  Either<String, List<Categorys>>
  responseHomeCategory;
  HomeResponseState(
    this.responseHomebaanner,
    this.responseHomeCategory,
  );
}
