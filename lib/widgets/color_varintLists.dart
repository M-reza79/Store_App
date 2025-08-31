// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

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
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: SizedBox(
          height: 32,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                widget.variantList.length,
            itemBuilder: (context, index) {
              int colorVariants = int.parse(
                '0xff${widget.variantList[index].value}',
              );
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  height: 32,
                  width: 32,
                  padding:
                      const EdgeInsets.all(
                        1.5,
                      ),
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    border:
                        (_selectedIndex ==
                            index)
                        ? Border.all(
                            width: 3,
                            color:
                                Range.green,
                            //بردر از بیرون میده ، یه جور بزرگ تر میکنه اون ویجت رو
                            strokeAlign:
                                BorderSide
                                    .strokeAlignOutside,
                          )
                        : Border.all(
                            width: 1,
                            color:
                                Colors.white,
                          ),
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.all(
                          Radius.circular(8),
                        ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(
                        colorVariants,
                      ),

                      borderRadius:
                          BorderRadius.all(
                            Radius.circular(
                              8,
                            ),
                          ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
