import 'package:flutter/material.dart';

import 'package:store_app/widgets/box_mahsol.dart';

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
          child: BoxMahsol(),
        );
      },
    );
  }
}
