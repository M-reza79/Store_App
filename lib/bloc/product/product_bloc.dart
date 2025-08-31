import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/product/product_event.dart';
import 'package:store_app/bloc/product/product_state.dart';
import 'package:store_app/data/model/carditem/card_item_modl.dart';
import 'package:store_app/data/repository/basket_repository.dart';
import 'package:store_app/data/repository/product_detail_repository.dart';

import 'package:store_app/di/di.dart';

class ProductDetailBloc
    extends
        Bloc<
          ProductDetailEvent,
          ProductDetailState
        > {
  final IProductDetailRepository _repository =
      locator.get();

  final IBasketRepository _basketRepository =
      locator.get();

  ProductDetailBloc()
    : super(ProductDetailInitstate()) {
    on<ProductDetailInitializeEvent>((
      event,
      emit,
    ) async {
      emit(ProductDetailLodingState());
      final responseProduct = await _repository
          .getGallerysR(event.productId);
      final responseProductVariant =
          await _repository.getProductVariantR(
            event.productId,
          );

      final responsecategorysId =
          await _repository.getProductCategoryR(
            event.categorysId,
          );
      final responsePropertiesId =
          await _repository.getProductPropertiesR(
            event.productId,
          );
      emit(
        ProductDetailResponseState(
          responseProduct,
          responseProductVariant,
          responsecategorysId,
          responsePropertiesId,
        ),
      );
    });

    on<ProductAddToBasket>((event, emit) {
      final cardItemModl = CardItemModl(
        event.product.categoryId,
        event.product.collectionId,
        event.product.discount_price,
        event.product.id,
        event.product.name,
        event.product.price,
        event.product.thumbnail,
 
      );
      _basketRepository.addProductR(cardItemModl);
    });
  }
}
