import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:store_app/data/model/product/products.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/util/api_exception.dart';

abstract class ICategoryProductData {
  Future<List<Products>> getProductsCategoryIdD(
    String categoryId,
  );
}

class CategoryProdauctRemotData
    extends ICategoryProductData {
  final Dio _dio = locator.get();

  @override
  Future<List<Products>> getProductsCategoryIdD(
    String categoryId,
  ) async {
    try {
      Map<String, String> queryParameters = {
        'filter': 'category="$categoryId"',
      };
      Response<dynamic> responseProducts;
      if (categoryId == 'qnbj8d6b9lzzpn8') {
        //همه
        responseProducts = await _dio.get(
          'collections/products/records',
        );
      } else {
        responseProducts = await _dio.get(
          'collections/products/records',
          queryParameters: queryParameters,
        );
      }

      return responseProducts.data['items']
          .map<Products>(
            (jsonObject) =>
                Products.fromMapJson(jsonObject),
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
