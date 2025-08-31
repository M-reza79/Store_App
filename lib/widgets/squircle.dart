import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/categoryProduct/category_product_bloc.dart';

import 'package:store_app/data/model/category/categorys.dart';
import 'package:store_app/extensions/color_pors_extensions.dart';
import 'package:store_app/pages/product_list_screen.dart';

import 'package:store_app/widgets/cached_image.dart';
import 'package:store_app/widgets/nviagt.dart';

class Squircle extends StatelessWidget {
  final Categorys ctegory;
  const Squircle({
    super.key,
    required this.ctegory,
  });
  @override
  Widget build(BuildContext context) {
    int coloreCatgory = int.parse(
      '0xff${ctegory.color}',
    );
    return InkWell(
      onTap: () {
        nviagt(
          context,
          BlocProvider(
            create: (context) =>
                CategoryProductBloc(),
            child: ProductListScreen(
              ctegory: ctegory,
            ),
          ),
        );
      },
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
                  color: Color(coloreCatgory),
                  shadows: [
                    BoxShadow(
                      color: Color(coloreCatgory),
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
                width: 30,
                height: 30,
                child: Center(
                  child: CachedkImage(
                    imageUrl: ctegory.icon,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            ctegory.title,
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
