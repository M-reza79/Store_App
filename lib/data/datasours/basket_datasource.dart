
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_app/data/model/carditem/card_item_modl.dart';

abstract class IBasketDatasource {
  Future<void> addProductD(
    CardItemModl cardItemModl,
  );

  Future<List<CardItemModl>>
  getAllCardItemModlD();
  Future<int> getBasketfinalPriceD();
}

class BasketLocalDatasource
    extends IBasketDatasource {
  final box = Hive.box<CardItemModl>('cardBox');
  @override
  Future<void> addProductD(
    CardItemModl cardItemModl,
  ) async {
    box.add(cardItemModl);
  }

  @override
  Future<List<CardItemModl>>
  getAllCardItemModlD() async {
    return box.values.toList();
  }

  @override
  Future<int> getBasketfinalPriceD() async {
    final productList = box.values.toList();
    final finalprice = productList.fold(
      0,
      (accumulator, product) =>
          accumulator + product.realPrice!,
    );
    
    return finalprice;
  }
}
