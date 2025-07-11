import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class CategoryIconItemChip
    extends StatelessWidget {
  const CategoryIconItemChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Column(
        children: [
          Stack(
            alignment:
                AlignmentDirectional.center,
            children: [
              Container(
                decoration: ShapeDecoration(
                  shape: ContinuousRectangleBorder(
                    borderRadius:
                        BorderRadiusGeometry.circular(
                          40,
                        ),
                  ),
                  color: Range.red,
                  shadows: [
                    BoxShadow(
                      color: Range.red,
                      blurRadius: 25,
                      spreadRadius: -13,
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

              Icon(
                size: 32,
                Icons.shape_line,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'همه',
            style: TextStyle(
              fontFamily: 'SB',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
