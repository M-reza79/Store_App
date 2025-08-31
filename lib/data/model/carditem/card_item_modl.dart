import 'package:hive_flutter/hive_flutter.dart';

part 'card_item_modl.g.dart';

// ویو کاری با دیتا  نداره و به بلاک خبر میده
// بلاک ارتباطش با ریپازیتوریه
// و ریپازیتوری با دیتا ارتباط داره

@HiveType(typeId: 0)
class CardItemModl {
  @HiveField(0)
  String categoryId;

  @HiveField(1)
  String collectionId;
  @HiveField(2)
  int discountprice;
  @HiveField(3)
  String id;
  @HiveField(4)
  String name;
  @HiveField(5)
  int price;
  @HiveField(6)
  String thumbnail;
  @HiveField(7)
  int? realPrice;
  @HiveField(8)
  num? persent;
 

  CardItemModl(
    this.categoryId,
    this.collectionId,
    this.discountprice,
    this.id,
    this.name,
    this.price,
    this.thumbnail,
    

  ) {
    //مبلغ که تخفیف ازش کم شده و پرداختی
    realPrice = price - discountprice;
    //درصد تخفیف
    persent =
        ((price - realPrice!) / price) * 100;
    // this.thumbnail=
    //   'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
  }
}
