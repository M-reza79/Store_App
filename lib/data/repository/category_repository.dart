import 'package:dartz/dartz.dart';
import 'package:store_app/data/datasours/category_data.dart';
import 'package:store_app/di/di.dart';
import 'package:store_app/model/category/categorys.dart';
import 'package:store_app/util/api_exception.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Categorys>>>
  getCategories();
}

class CategoryRepository
    extends ICategoryRepository {
  final ICategoryData _datasource = locator
      .get();

  @override
  Future<Either<String, List<Categorys>>>
  getCategories() async {
    try {
      var responseCategory =
          await _datasource.getGatgories();
      return right(responseCategory);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }
}
