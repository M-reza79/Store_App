import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/product/product_event.dart';
import 'package:store_app/bloc/product/product_state.dart';
import 'package:store_app/data/repository/product_detail_repository.dart';

import 'package:store_app/di/di.dart';

class ProductDetailBloc
    extends
        Bloc<
          ProductDetailEvent,
          ProductDetailState
        > {
  final IProductDetailRepository
  _repository = locator.get();

  ProductDetailBloc()
    : super(ProductDetailInitstate()) {
    on<ProductDetailInitializeEvent>((
      event,
      emit,
    ) async {
      emit(ProductDetailLodingState());
      final responseProduct =
          await _repository.getGallerysR();
      final responseProductVariant =
          await _repository
              .getProductVariantR();
      emit(
        ProductDetailResponseState(
          responseProduct,
          responseProductVariant,
        ),
      );
    });
  }
}
