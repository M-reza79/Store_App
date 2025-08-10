import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/data/datasours/authentication_datascource.dart';
import 'package:dartz/dartz.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/util/api_exception.dart';
import 'package:store_app/util/auth_manager.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> rgister(
    String username,
    String password,
    String passwordConfirmation,
  );

  Future<Either<String, String>> login(
    String username,
    String password,
  );
}

class AuthenticationRepository
    extends IAuthRepository {
  final IAuthenticationDatasoruce
  _datasource = locator.get();

  @override
  Future<Either<String, String>> rgister(
    String username,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      await _datasource.register(
        username,
        password,
        passwordConfirmation,
      );
      return right('ثبت نام انجام شد');
    } on ApiException catch (ex) {
      if (ex.message == null) {
        return left('خطا در ثبت نام');
      } else {
        return left('قبلا ثبت نام شده');
      }
    } catch (ex) {
      return left('خطای ناشناخته');
    }
  }

  @override
  Future<Either<String, String>> login(
    String username,
    String password,
  ) async {
    try {
      String token = await _datasource.login(
        username,
        password,
      );
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('شما وارد شدید');
      } else {
        return left('خطا در ورود');
      }
    } on ApiException catch (ex) {
      return left('${ex.message} not foind');
    }
  }
}
