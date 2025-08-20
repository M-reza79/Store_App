import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/model/variants/variants.dart';

class SotrageVariantListState
    extends StatefulWidget {
  final List<Variant> sotrageVariantList;

  const SotrageVariantListState({
    super.key,
    required this.sotrageVariantList,
  });

  @override
  State<SotrageVariantListState>
  createState() =>
      _SotrageVariantListStateState();
}

class _SotrageVariantListStateState
    extends State<SotrageVariantListState> {
  List<Widget> sotrageWidget = [];
  @override
  void initState() {
    final List<Variant> variantList =
        widget.sotrageVariantList;
    for (var sotrageVariant in variantList) {
      var item = Container(
        height: 28,

        margin: const EdgeInsets.only(
          left: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Range.grey,
          ),
          borderRadius:
              const BorderRadius.all(
                Radius.circular(10),
              ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),
          child: Center(
            child: Text(
              '${sotrageVariant.value}',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
      sotrageWidget.add(item);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: SizedBox(
          height: 25,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sotrageWidget.length,
            itemBuilder: (context, index) {
              return sotrageWidget[index];
            },
          ),
        ),
      ),
    );
  }
}
