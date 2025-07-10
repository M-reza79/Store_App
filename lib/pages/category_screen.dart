import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Range.backgroundScreenColor,
      body: SafeArea(
        child: Container(
          color: Colors.amber,
          child: Text('dasd'),
        ),
      ),
    );
  }
}
