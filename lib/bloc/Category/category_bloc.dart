import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/Category/category_event.dart';
import 'package:store_app/bloc/Category/category_state.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/di/di.dart';

class CategoryBloc
    extends
        Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _repository =
      locator.get();

  CategoryBloc()
    : super(InitCategoryState()) {
    on<CategoryRequestEvent>((
      event,
      emit,
    ) async {
      final responseCategory =
          await _repository.getCategories();
      emit(
        CategoryResponseState(
          responseCategory,
        ),
      );
    });
  }
}
