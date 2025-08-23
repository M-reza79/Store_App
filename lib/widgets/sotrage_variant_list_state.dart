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
  State<SotrageVariantListState> createState() =>
      _SotrageVariantListStateState();
}

class _SotrageVariantListStateState
    extends State<SotrageVariantListState> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: SizedBox(
          height: 25,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                widget.sotrageVariantList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  height: 28,

                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        (_selectedIndex == index)
                        ? Border.all(
                            width: 3,

                            color: Range.green,
                            //بردر از بیرون میده ، یه جور بزرگ تر میکنه اون ویجت رو
                            strokeAlign: BorderSide
                                .strokeAlignOutside,
                          )
                        : Border.all(
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
                        '${widget.sotrageVariantList[index].value}',
                        style: TextStyle(
                          fontFamily: 'SB',
                          fontSize: 12,
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
