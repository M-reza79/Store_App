import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class ProductDetailScreen
    extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,
      body: SafeArea(child: Container()),
    );
  }
}
