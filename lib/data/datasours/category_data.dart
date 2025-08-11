import 'package:dio/dio.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/model/category/category.dart';
import 'package:store_app/util/api_exception.dart';

abstract class ICategoryData {
  Future<List<Categorys>> getGatgories();
}

class CategoryRemotdata
    extends ICategoryData {
  final Dio _dio = locator.get();
  @override
  Future<List<Categorys>>
  getGatgories() async {
    try {
      var responseCategory = await _dio.get(
        'collections/category/records',
      );

      return responseCategory.data['items']
          .map<Categorys>(
            (jsonObject) =>
                Categorys.fromMapJson(
                  jsonObject,
                ),
          )
          .toList();

      //
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
