import 'package:flutter/material.dart';

import '/all_path.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main app color
    scaffoldBackgroundColor: ColorManager.white,
    primaryColor: ColorManager.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.green,
    ),

    // icon theme
    iconTheme: IconThemeData(color: ColorManager.white),

    // Text theme
    textTheme: TextTheme(
        headline1: getSemiBoldStyle(
            color: ColorManager.black, fontSize: FontSize.fs20),
        headline2:
            getLightStyle(color: ColorManager.black, fontSize: FontSize.fs12)),

    //AppBar Theme

    appBarTheme: AppBarTheme(
      color: ColorManager.white,
      elevation: 1,
      shadowColor: ColorManager.white,
      iconTheme: IconThemeData(
        color: ColorManager.black,
        size: AppSize.s30,
      ),
    ),

    //listTile theme
    listTileTheme: ListTileThemeData(iconColor: ColorManager.black),

    // button theme

    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.green,
    ),

    //switch theme
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return ColorManager.white;
        }
        return ColorManager.green;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return ColorManager.white;
        }
        return ColorManager.green;
      }),
    ),

    //bottomSheet theme
  );
}
