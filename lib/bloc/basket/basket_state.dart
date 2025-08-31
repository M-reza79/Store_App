import 'package:dartz/dartz.dart';
import 'package:store_app/data/model/carditem/card_item_modl.dart';

abstract class BasketState {}

class InitBasketState extends BasketState {}

class BasketLodingState extends BasketState {}

class BasketResponseState extends BasketState {
  Either<String, List<CardItemModl>>
  responseBasketItemState;
  Either<String, int> responseBasketfinalPrice;
  BasketResponseState(
    this.responseBasketItemState,
    this.responseBasketfinalPrice,
  );
}
