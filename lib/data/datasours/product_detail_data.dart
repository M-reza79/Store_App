import 'package:dio/dio.dart';
import 'package:store_app/data/model/product_variant/product_variant.dart';
import 'package:store_app/data/model/variants/variants.dart';
import 'package:store_app/data/model/variants_type/variants_types.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/data/model/gallery/product_image.dart';
import 'package:store_app/util/api_exception.dart';

abstract class IProductDetailData {
  Future<List<ProductImage>> getGallerysD();
  Future<List<VariantsTypes>>
  getVariantsTypesD();
  Future<List<Variant>> getVariantD();
  Future<List<ProductVariant>>
  getProductVariantD();
}

class ProductDetailGalleryRemotData
    extends IProductDetailData {
  final Dio _dio = locator.get();
  //
  @override
  Future<List<ProductImage>>
  getGallerysD() async {
    try {
      Map<String, String> queryParameters = {
        'filter':
            'product_id="5vvww65pv6nviw6"',
      };
      var responseProductDetailData =
          await _dio.get(
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
      var responseProductDetailData =
          await _dio.get(
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
  Future<List<Variant>> getVariantD() async {
    try {
      Map<String, String> qParamet = {
        'filter':
            'product_id="5vvww65pv6nviw6"',
      };
      var responseProductDetailData =
          await _dio.get(
            'collections/variants/records',
            queryParameters: qParamet,
          );

      return responseProductDetailData
          .data['items']
          .map<Variant>(
            (jsonObject) =>
                Variant.fromMapJson(
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

  @override
  Future<List<ProductVariant>>
  getProductVariantD() async {
    final variantTypeList =
        await getVariantsTypesD();
    final variantList = await getVariantD();

    List<ProductVariant> productVariantList =
        [];
    for (var variantType
        in variantTypeList) {
      var variants = variantList
          .where(
            (element) =>
                element.typeid ==
                variantType.id,
          )
          .toList();
      productVariantList.add(
        ProductVariant(
          variantType,
          variants,
        ),
      );
    }
    return productVariantList;
  }
}
