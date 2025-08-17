import 'package:dartz/dartz.dart';
import 'package:store_app/data/datasours/products_data.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/model/product/products.dart';
import 'package:store_app/util/api_exception.dart';

abstract class IProductsRepository {
  Future<Either<String, List<Products>>>
  getProductsR();
  Future<Either<String, List<Products>>>
  getHotestProductsR();
  Future<Either<String, List<Products>>>
  getBestSellerProductsR();
}

class ProductsRepository
    extends IProductsRepository {
  final IProductsData _productsData = locator
      .get();

  @override
  Future<Either<String, List<Products>>>
  getProductsR() async {
    try {
      var responseProducts =
          await _productsData.getProductsD();
      return right(responseProducts);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }

  @override
  Future<Either<String, List<Products>>>
  getHotestProductsR() async {
    try {
      var responseProducts =
          await _productsData
              .getHotestProductsD();
      return right(responseProducts);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }

  @override
  Future<Either<String, List<Products>>>
  getBestSellerProductsR() async {
    try {
      var responseProducts =
          await _productsData
              .getBestSellerProductsD();
      return right(responseProducts);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }
}
