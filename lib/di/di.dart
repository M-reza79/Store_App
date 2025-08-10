import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/data/datasours/authentication_datascource.dart';
import 'package:store_app/data/repository/authentication_repository.dart';

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

  //repositories
  locator.registerFactory<IAuthRepository>(
    () => AuthenticationRepository(),
  );
}
