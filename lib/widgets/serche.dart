import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class Serche extends StatelessWidget {
  const Serche({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.all(
        Radius.circular(15),
      ),
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,

          hintTextDirection:
              TextDirection.rtl,
          hintText: 'جستجوی محصولات',
          hintStyle: TextStyle(
            color: Range.grey,
            fontFamily: 'sm',
            fontSize: 16,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              right: 5,
            ),
            child: Icon(Icons.search),
          ),
          suffixIconColor:
              Range.blueIndicator,
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Image.asset(
              'assets/images/icon_apple_blue.png',
            ),
          ),
        ),
      ),
    );
  }
}









//  Container(
//       height: 46,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(
//           Radius.circular(15),
//         ),
//       ),
//     );