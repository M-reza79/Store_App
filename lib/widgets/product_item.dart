import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Container(
            width: 160,
            height: 216,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 10),
                BakshePainii(),
                Spacer(),
                BakcshBalaii(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BakcshBalaii extends StatelessWidget {
  const BakcshBalaii({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            right: 10,
          ),
          child: Text(
            'آیفون 11 پرومکس',
            style: TextStyle(
              fontFamily: 'sm',
              fontSize: 14,
            ),
          ),
        ),

        Container(
          height: 53,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                15,
              ),
              bottomRight: Radius.circular(
                15,
              ),
            ),
            color: Range.blue,
            boxShadow: [
              BoxShadow(
                color: Range.blue,
                blurRadius: 25,
                spreadRadius: -12,
                offset: Offset(0, 15),
              ),
            ],
          ),
          child: Padding(
            padding:
                EdgeInsetsGeometry.symmetric(
                  horizontal: 10,
                ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                Text(
                  'تومان ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sm',
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                  children: [
                    Text(
                      '20000000',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sm',
                        fontSize: 12,
                        decoration:
                            TextDecoration
                                .lineThrough,
                        decorationColor:
                            Colors.white,
                      ),
                    ),
                    Text(
                      '12000000',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sm',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 30,
                  child: Image.asset(
                    'assets/images/icon_right_arrow_cricle.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BakshePainii extends StatelessWidget {
  const BakshePainii({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(width: double.infinity),
        Image.asset(
          'assets/images/iphone.png',
        ),
        Positioned(
          top: 0,
          right: 10,
          child: SizedBox(
            width: 25,
            height: 25,
            child: Image.asset(
              'assets/images/active_fav_product.png',
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Range.red,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                child: Text(
                  '%25',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sm',
                    fontSize: 10,
                  ),
                  textAlign:
                      TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
