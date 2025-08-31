import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/basket/basket_event.dart';
import 'package:store_app/bloc/basket/basket_state.dart';
import 'package:store_app/data/repository/basket_repository.dart';
import 'package:store_app/di/di.dart';

class BasketBloc
    extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository =
      locator.get();

  BasketBloc() : super(InitBasketState()) {
    on<BasketRequestEvent>((event, emit) async {
      emit(BasketLodingState());

      final basketItemList =
          await _basketRepository
              .getAllCardItemModlR();
      final basketPrice =
          await _basketRepository
              .getBasketfinalPriceR();
      emit(BasketResponseState(basketItemList,
      basketPrice
      ));
    });
  }
}
