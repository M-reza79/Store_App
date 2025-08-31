import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class CategoryIconItemChip
    extends StatelessWidget {
  final String imaged;
  final String titeld;
  const CategoryIconItemChip({
    super.key,
    required this.imaged,
    required this.titeld,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
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
                  color: Range.blue,
                  shadows: [
                    BoxShadow(
                      color: Range.blue,
                      blurRadius: 25,
                      spreadRadius: -13,
                      offset: Offset(0.0, 15),
                    ),
                  ],
                ),
                height: 56,
                width: 56,
              ),

              SizedBox(
                height: 45,
                width: 45,
                child: Center(
                  child: Image.asset(
                    'assets/images/$imaged.png',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            titeld,
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
