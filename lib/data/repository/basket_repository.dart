import 'package:dartz/dartz.dart';
import 'package:store_app/data/datasours/basket_datasource.dart';
import 'package:store_app/data/model/carditem/card_item_modl.dart';
import 'package:store_app/di/di.dart';

abstract class IBasketRepository {
  Future<Either<String, String>> addProductR(
    CardItemModl cardItemModl,
  );
  Future<Either<String, List<CardItemModl>>>
  getAllCardItemModlR();

  Future<Either<String, int>>
  getBasketfinalPriceR();
}

class BasketRepository extends IBasketRepository {
  final IBasketDatasource _basketDatasource =
      locator.get();
  @override
  Future<Either<String, String>> addProductR(
    CardItemModl cardItemModl,
  ) async {
    try {
      _basketDatasource.addProductD(cardItemModl);
      return right(
        'محصول با موفقیت به سبد خرید اضافه شد',
      );
    } catch (ex) {
      return left(
        ' با خطا مواجه شد در افزودن محصولات',
      );
    }
  }

  @override
  Future<Either<String, List<CardItemModl>>>
  getAllCardItemModlR() async {
    try {
      final basktItme = await _basketDatasource
          .getAllCardItemModlD();
      return right(basktItme);
    } catch (ex) {
      return left(
        ' با خطا مواجه شد در نمایش محصولات',
      );
    }
  }
  
  @override
  Future<Either<String, int>> getBasketfinalPriceR() async{
    try {
       final basketPrice = await _basketDatasource
          .getBasketfinalPriceD();
     
      return right(basketPrice);
    } catch (ex) {
      return left(
        ' با خطا مواجه شد در قیمت محصولات',
      );
    }
  }
}
