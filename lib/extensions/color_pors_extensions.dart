import 'dart:ui';

extension ColorPorsExtensions on String {
  Color parseToColor() {
    int coloreString = int.parse('0xff${this}');
    return Color(coloreString);
  }
}
