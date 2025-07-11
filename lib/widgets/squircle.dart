import 'package:flutter/material.dart';

import 'package:store_app/widgets/category_icon_item_chip.dart';

class Squircle extends StatelessWidget {
  const Squircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 30,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CategoryIconItemChip();
        },
      ),
    );
  }
}
