import 'package:dio/dio.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/model/category/category.dart';

abstract class ICategoryData {
  Future<List<Categorys>> getGatgories();
}

class CategoryRemotdata
    extends ICategoryData {
  final Dio _dio = locator.get();
  @override
  Future<List<Categorys>>
  getGatgories() async {
    var responseCategory = await _dio.post(
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
  }
}
