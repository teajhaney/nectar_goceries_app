import 'package:flutter/material.dart';

class ColorManager {
  static Color white = HexColor.fromHex('#F6F9F9');
  static Color whiteGrey = HexColor.fromHex('#F2F3F2');
  static Color green = HexColor.fromHex('#53B175');
  static Color black = HexColor.fromHex('#181725');
  static Color grey = HexColor.fromHex('#7C7C7C');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
