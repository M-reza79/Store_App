import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/model/category/categorys.dart';
 
import 'package:store_app/widgets/cached_image.dart';

class Squircle extends StatelessWidget {
  final List<Categorys> list;
  const Squircle({
    super.key,
    required this.list,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 30,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          int coloreCatgory = int.parse(
            '0xff${list[index].color}',
          );
          // String stringcoloreCatgory =
          //     'xff${list[index].color}';
          // int coloreCatgory = int.parse(
          //   stringcoloreCatgory,
          //   radix: 16,
          // );

          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              children: [
                Stack(
                  alignment:
                      AlignmentDirectional
                          .center,
                  children: [
                    Container(
                      decoration: ShapeDecoration(
                        shape: ContinuousRectangleBorder(
                          borderRadius:
                              BorderRadiusGeometry.circular(
                                40,
                              ),
                        ),
                        color: Color(
                          coloreCatgory,
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(
                              coloreCatgory,
                            ),
                            blurRadius: 25,
                            spreadRadius:
                                -13,
                            offset: Offset(
                              0.0,
                              15,
                            ),
                          ),
                        ],
                      ),
                      height: 56,
                      width: 56,
                    ),

                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: CachedkImage(
                          imageUrl:
                              list[index].icon,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  list[index].title,
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
