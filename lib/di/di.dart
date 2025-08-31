import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/bloc/basket/basket_bloc.dart';
import 'package:store_app/data/datasours/authentication_datascource.dart';
import 'package:store_app/data/datasours/banner_data.dart';
import 'package:store_app/data/datasours/basket_datasource.dart';
import 'package:store_app/data/datasours/category_data.dart';
import 'package:store_app/data/datasours/category_product_data.dart';
import 'package:store_app/data/datasours/product_detail_data.dart';
import 'package:store_app/data/datasours/products_data.dart';
import 'package:store_app/data/repository/authentication_repository.dart';
import 'package:store_app/data/repository/banner_repository.dart';
import 'package:store_app/data/repository/basket_repository.dart';
import 'package:store_app/data/repository/category_product_repository.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/data/repository/product_detail_repository.dart';
import 'package:store_app/data/repository/products_repository.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  //componenets
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://startflutter.ir/api/',
      ),
    ),
  );
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  //datasources
  locator
      .registerFactory<IAuthenticationDatasoruce>(
        () => AuthenticationRemote(),
      );

  //
  locator.registerFactory<ICategoryData>(
    () => CategoryRemotData(),
  );

  //

  locator.registerFactory<IBannerData>(
    () => BannerRemotData(),
  );

  //
  locator.registerFactory<IProductsData>(
    () => ProductsRemotData(),
  );

  //
  locator.registerFactory<IProductDetailData>(
    () => ProductDetailGalleryRemotData(),
  );

  //
  locator.registerFactory<ICategoryProductData>(
    () => CategoryProdauctRemotData(),
  );

  //
  locator.registerFactory<IBasketRepository>(
    () => BasketRepository(),
  );

  //repositories
  locator.registerFactory<IAuthRepository>(
    () => AuthenticationRepository(),
  );

  //
  locator.registerFactory<ICategoryRepository>(
    () => CategoryRepository(),
  );

  //
  locator.registerFactory<IBannerRepository>(
    () => BannerRepository(),
  );

  //
  locator.registerFactory<IProductsRepository>(
    () => ProductsRepository(),
  );

  //
  locator
      .registerFactory<IProductDetailRepository>(
        () => ProductDetailRepository(),
      );

  //
  locator.registerFactory<
    ICategorysProductRepository
  >(() => CategoryProductRepository());

  //
  locator.registerFactory<IBasketDatasource>(
    () => BasketLocalDatasource(),
  );

  //bloc
  locator.registerSingleton<BasketBloc>(
    BasketBloc(),
  );
}
