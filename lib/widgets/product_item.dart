import 'package:flutter/material.dart';
import 'package:store_app/model/product/products.dart';

import 'package:store_app/widgets/box_mahsol.dart';

class ProductItem extends StatelessWidget {
  final List<Products> list;

  const ProductItem({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: BoxMahsol(
            product: list[index],
          ),
        );
      },
    );
  }
}
