import 'package:store_app/data/model/variants/variants.dart';
import 'package:store_app/data/model/variants_type/variants_types.dart';

class ProductVariant {
  VariantsTypes variantsType;
  List<Variant> variantList;
  ProductVariant(
    this.variantsType,
    this.variantList,
  );
}
