
import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class DarsadOff extends StatelessWidget {
  const DarsadOff({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Range.red,
        borderRadius:
            BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(
              horizontal:
                  4,
              vertical: 2,
            ),
        child: Text(
          '%25',
          style: TextStyle(
            color: Colors
                .white,
            fontFamily:
                'SB',
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}