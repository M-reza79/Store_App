import 'package:dio/dio.dart';
import 'package:store_app/data/model/category/categorys.dart';
import 'package:store_app/data/model/product_variant/product_variant.dart';
import 'package:store_app/data/model/properties/properties.dart';
import 'package:store_app/data/model/variants/variants.dart';
import 'package:store_app/data/model/variants_type/variants_types.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/data/model/gallery/product_image.dart';
import 'package:store_app/util/api_exception.dart';

abstract class IProductDetailData {
  Future<List<ProductImage>> getGallerysD(
    String productId,
  );
  Future<List<VariantsTypes>> getVariantsTypesD();
  Future<List<Variant>> getVariantD(
    String productId,
  );
  Future<List<ProductVariant>> getProductVariantD(
    String productId,
  );
  Future<Categorys> getProductCategoryD(
    String categorysId,
  );
  Future<List<Properties>> getProductPropertiesD(
    String productId,
  );
}

class ProductDetailGalleryRemotData
    extends IProductDetailData {
  final Dio _dio = locator.get();
  //
  @override
  Future<List<ProductImage>> getGallerysD(
    String productId,
  ) async {
    try {
      Map<String, String> queryParameters = {
        'filter': 'product_id="$productId"',
      };
      var responseProductDetailData = await _dio
          .get(
            'collections/gallery/records',
            queryParameters: queryParameters,
          );

      return responseProductDetailData
          .data['items']
          .map<ProductImage>(
            (jsonObject) =>
                ProductImage.fromMapJson(
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

  //
  @override
  Future<List<VariantsTypes>>
  getVariantsTypesD() async {
    try {
      var responseProductDetailData = await _dio
          .get(
            'collections/variants_type/records',
          );

      return responseProductDetailData
          .data['items']
          .map<VariantsTypes>(
            (jsonObject) =>
                VariantsTypes.fromMapJson(
                  jsonObject,
                ),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'error unknown');
    }
  }

  //
  @override
  Future<List<Variant>> getVariantD(
    String productId,
  ) async {
    try {
      Map<String, String> qParamet = {
        'filter': 'product_id="$productId"',
      };
      var responseProductDetailData = await _dio
          .get(
            'collections/variants/records',
            queryParameters: qParamet,
          );

      return responseProductDetailData
          .data['items']
          .map<Variant>(
            (jsonObject) =>
                Variant.fromMapJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        ' error: ${ex.toString()}',
      );
    }
  }

  @override
  Future<List<ProductVariant>> getProductVariantD(
    String productId,
  ) async {
    final variantTypeList =
        await getVariantsTypesD();
    final variantList = await getVariantD(
      productId,
    );

    List<ProductVariant> productVariantList = [];
    try {
      for (var variantType in variantTypeList) {
        var variants = variantList
            .where(
              (element) =>
                  element.typeid ==
                  variantType.id,
            )
            .toList();
        productVariantList.add(
          ProductVariant(variantType, variants),
        );
      }
      return productVariantList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        ' error: ${ex.toString()}',
      );
    }
  }

  @override
  Future<Categorys> getProductCategoryD(
    String categorysId,
  ) async {
    try {
      Map<String, String> qParamet = {
        'filter': 'id="$categorysId"',
      };
      var responseProductCategory = await _dio
          .get(
            'collections/category/records',
            queryParameters: qParamet,
          );
      return Categorys.fromMapJson(
        responseProductCategory.data['items'][0],
      );
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        ' error: ${ex.toString()}',
      );
    }
  }

  @override
  Future<List<Properties>> getProductPropertiesD(
    String productId,
  ) async {
    try {
      Map<String, String> qParamet = {
        'filter': 'product_id="$productId"',
      };
      var responseProductProperties = await _dio
          .get(
            'collections/properties/records',
            queryParameters: qParamet,
          );
      return responseProductProperties
          .data['items']
          .map<Properties>(
            (jsonObject) =>
                Properties.fromMapJson(
                  jsonObject,
                ),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        ' error: ${ex.toString()}',
      );
    }
  }
}
