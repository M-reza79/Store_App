import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/product/product_bloc.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/data/model/product/products.dart';

import 'package:store_app/pages/product_detail_screen.dart';
import 'package:store_app/widgets/cached_image.dart';
import 'package:store_app/widgets/nviagt.dart';

class BoxMahsol extends StatelessWidget {
  final Products product;
  const BoxMahsol({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => nviagt(
        context,
        BlocProvider(
          create: (context) =>
              ProductDetailBloc(),
          child: ProductDetailScreen(product),
        ),
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
          children: [
            SizedBox(height: 10),
            BakshePainii(product: product),
            Spacer(),
            BakcshBalaii(product: product),
          ],
        ),
      ),
    );
  }
}

class BakcshBalaii extends StatelessWidget {
  final Products product;

  const BakcshBalaii({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            right: 10,
          ),
          child: Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
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
                      product.price
                          .toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sm',
                        fontSize: 12,
                        decoration:
                            TextDecoration
                                .lineThrough,

                        //کلفتی خط
                        decorationThickness:
                            2.5,

                        decorationColor:
                            Colors.white,
                      ),
                    ),
                    Text(
                      // ' ${product.price - product.discount_price}',
                      product.realPrice
                          .toString(),
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
                  width: 24,
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
  final Products product;

  const BakshePainii({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(width: double.infinity),
        // Expanded(child: Container()),
        SizedBox(
          height: 100,
          width: 100,
          child: CachedkImage(
            imageUrl: product.thumbnail,
          ),
        ),
        Positioned(
          top: 0,
          right: 10,
          child: SizedBox(
            width: 24,
            height: 24,
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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
              child: Text(
                '%${product.persent!.round()}',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SB',
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
