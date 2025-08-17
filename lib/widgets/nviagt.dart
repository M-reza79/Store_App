import 'package:flutter/material.dart';

void nviagt(BuildContext context,Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }