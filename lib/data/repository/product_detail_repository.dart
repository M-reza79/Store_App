import 'package:dartz/dartz.dart';
import 'package:store_app/data/datasours/product_detail_data.dart';
import 'package:store_app/data/model/category/categorys.dart';
import 'package:store_app/data/model/product_variant/product_variant.dart';
import 'package:store_app/data/model/variants_type/variants_types.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/data/model/gallery/product_image.dart';
import 'package:store_app/util/api_exception.dart';

abstract class IProductDetailRepository {
  Future<Either<String, List<ProductImage>>>
  getGallerysR(String productId);

  Future<Either<String, List<VariantsTypes>>>
  getVariantsTypesR();

  Future<Either<String, List<ProductVariant>>>
  getProductVariantR();
  Future<Either<String, Categorys>>
  getProductCategoryR(String categorysId);
}

class ProductDetailRepository
    extends IProductDetailRepository {
  final IProductDetailData _productDetailData =
      locator.get();
  @override
  Future<Either<String, List<ProductImage>>>
  getGallerysR(String productId) async {
    try {
      var responseProducts =
          await _productDetailData.getGallerysD(
            productId,
          );
      return right(responseProducts);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }

  @override
  Future<Either<String, List<VariantsTypes>>>
  getVariantsTypesR() async {
    try {
      var responseProducts =
          await _productDetailData
              .getVariantsTypesD();
      return right(responseProducts);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>>
  getProductVariantR() async {
    try {
      var responseProducts =
          await _productDetailData
              .getProductVariantD();
      return right(responseProducts);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }

  @override
  Future<Either<String, Categorys>>
  getProductCategoryR(String categorysId) async {
    try {
      var responsecategorysId =
          await _productDetailData
              .getProductCategoryD(categorysId);
      return right(responsecategorysId);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }
}
