import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/categoryProduct/category_product_event.dart';
import 'package:store_app/bloc/categoryProduct/category_product_state.dart';
import 'package:store_app/data/repository/category_product_repository.dart';
import 'package:store_app/di/di.dart';

class CategoryProductBloc
    extends
        Bloc<
          CategoryProductEvent,
          CategoryProductState
        > {
  final ICategorysProductRepository _repository =
      locator.get();
  CategoryProductBloc()
    : super(CategoryProductInitializeState()) {
    on<CategoryInitializeProductEvent>((
      event,
      emit,
    ) async {
      emit(CategoryProductLodingState());
      final response = await _repository
          .getProductsByCategoryIdR(
            event.categoryId,
          );
      emit(
        CategoryProductResponseState(response),
      );
    });
  }
}
