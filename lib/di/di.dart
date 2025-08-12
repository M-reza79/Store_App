import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/data/datasours/authentication_datascource.dart';
import 'package:store_app/data/datasours/banner_data.dart';
import 'package:store_app/data/datasours/category_data.dart';
import 'package:store_app/data/repository/authentication_repository.dart';
import 'package:store_app/data/repository/banner_repository.dart';
import 'package:store_app/data/repository/category_repository.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  //componenets
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl:
            'https://startflutter.ir/api/',
      ),
    ),
  );
  locator.registerSingleton<
    SharedPreferences
  >(await SharedPreferences.getInstance());

  //datasources
  locator.registerFactory<
    IAuthenticationDatasoruce
  >(() => AuthenticationRemote());

  //
  locator.registerFactory<ICategoryData>(
    () => CategoryRemotData(),
  );

  //

  locator.registerFactory<IBannerData>(
    () => BannerRemotData(),
  );

  //repositories
  locator.registerFactory<IAuthRepository>(
    () => AuthenticationRepository(),
  );

  //

  locator
      .registerFactory<ICategoryRepository>(
        () => CategoryRepository(),
      );

  //
  locator.registerFactory<IBannerRepository>(
    () => BannerRepository(),
  );

  //
}
