import 'package:dio/dio.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/model/product/products.dart';
import 'package:store_app/util/api_exception.dart';

abstract class IProductsData {
  Future<List<Products>> getProductsD();
  Future<List<Products>>
  getHotestProductsD();
  Future<List<Products>>
  getBestSellerProductsD();
}

class ProductsRemotData
    extends IProductsData {
  final Dio _dio = locator.get();

  @override
  Future<List<Products>>
  getProductsD() async {
    try {
      var responseProducts = await _dio.get(
        'collections/products/records',
      );
      return responseProducts.data['items']
          .map<Products>(
            (jsonObject) =>
                Products.fromMapJson(
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

  @override
  Future<List<Products>>
  getHotestProductsD() async {
    try {
      Map<String, String> qParams = {
        'filter': 'popularity="Hotest"',
      };
      var responseProducts = await _dio.get(
        'collections/products/records',
        queryParameters: qParams,
      );
      return responseProducts.data['items']
          .map<Products>(
            (jsonObject) =>
                Products.fromMapJson(
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

  @override
  Future<List<Products>>
  getBestSellerProductsD() async {
    try {
      Map<String, String> queryParameters = {
        'filter': 'popularity="Best Seller"',
      };
      var responseProducts = await _dio.get(
        'collections/products/records',
        queryParameters: queryParameters,
      );
      return responseProducts.data['items']
          .map<Products>(
            (jsonObject) =>
                Products.fromMapJson(
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
