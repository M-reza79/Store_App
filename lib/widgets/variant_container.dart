import 'package:flutter/material.dart';
import 'package:store_app/data/model/product_variant/product_variant.dart';
import 'package:store_app/data/model/variants_type/variants_types.dart';
import 'package:store_app/widgets/color_varintLists.dart';
import 'package:store_app/widgets/sotrage_variant_list_state.dart';

class VariantContainer extends StatefulWidget {
  final List<ProductVariant> productVariantList;

  const VariantContainer({
    super.key,
    required this.productVariantList,
  });

  @override
  State<VariantContainer> createState() =>
      _VariantContainerState();
}

class _VariantContainerState
    extends State<VariantContainer> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          for (var productVariant
              in widget.productVariantList) ...[
            if (productVariant
                .variantList
                .isNotEmpty) ...[
              VarianGeneratorChild(
                productVariant: productVariant,
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class VarianGeneratorChild
    extends StatelessWidget {
  final ProductVariant productVariant;
  const VarianGeneratorChild({
    super.key,
    required this.productVariant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.end,
        children: [
          SizedBox(height: 10),
          Text(
            productVariant.variantsType.title,
            style: TextStyle(
              fontFamily: 'sm',
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.end,
            children: [
              if (productVariant
                      .variantsType
                      .type ==
                  VariantsTypeEnum.color) ...[
                ColorVariantLists(
                  variantList:
                      productVariant.variantList,
                ),
              ],

              if (productVariant
                      .variantsType
                      .type ==
                  VariantsTypeEnum.storage) ...[
                SotrageVariantListState(
                  sotrageVariantList:
                      productVariant.variantList,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
