import 'package:dio/dio.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/util/api_exception.dart';

abstract class IAuthenticationDatasoruce {
  Future<void> register(
    String username,
    String password,
    String passwordConfirmation,
  );

  Future<String> login(
    String username,
    String password,
  );
}

class AuthenticationRemote
    implements IAuthenticationDatasoruce {
  final Dio _dio = locator.get();

  @override
  Future<void> register(
    String username,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      final response = await _dio.post(
        'collections/users/records',
        data: {
          'username': username,
          'password': password,
          'passwordConfirm':
              passwordConfirmation,
        },
      );
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<String> login(
    String username,
    String password,
  ) async {
    try {
      var response = await _dio.post(
        'collections/users/auth-with-password',
        data: {
          'identity': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw ApiException(
          response.statusCode,
          response.data['message'],
        );
      }
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
    return '';
  }
}
