import 'package:dartz/dartz.dart';
import 'package:store_app/data/datasours/category_product_data.dart';
import 'package:store_app/data/model/product/products.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/util/api_exception.dart';

abstract class ICategorysProductRepository {
  Future<Either<String, List<Products>>>
  getProductsByCategoryIdR(String categoryId);
}

class CategoryProductRepository
    extends ICategorysProductRepository {
  final ICategoryProductData _productData =
      locator.get();
  @override
  Future<Either<String, List<Products>>>
  getProductsByCategoryIdR(
    String categoryId,
  ) async {
    try {
      var responseProducts = await _productData
          .getProductsCategoryIdD(categoryId);
      return right(responseProducts);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }
}
