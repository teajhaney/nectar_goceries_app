import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '/all_path.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    height: 1,
  );
}

// light style
TextStyle getLightStyle(
    {double fontSize = FontSize.fs12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.fs12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style
TextStyle getMediumStyle(
    {double fontSize = FontSize.fs12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// semibold style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.fs12,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

// bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.fs20, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
