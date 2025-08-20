// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:store_app/data/model/variants/variants.dart';

class ColorVariantLists
    extends StatefulWidget {
  final List<Variant> variantList;
  const ColorVariantLists({
    super.key,
    required this.variantList,
  });

  @override
  State<ColorVariantLists> createState() =>
      _ColorVariantListsState();
}

class _ColorVariantListsState
    extends State<ColorVariantLists> {
  List<Widget> colorWidget = [];

  @override
  void initState() {
    final List<Variant> variantList =
        widget.variantList;
    for (var colorVariant in variantList) {
      int colorVariants = int.parse(
        '0xff${colorVariant.value}',
      );
      var item = Container(
        height: 26,
        width: 26,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Color(colorVariants),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      );
      colorWidget.add(item);
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
            itemCount: colorWidget.length,
            itemBuilder: (context, index) {
              return colorWidget[index];
            },
          ),
        ),
      ),
    );
  }
}
