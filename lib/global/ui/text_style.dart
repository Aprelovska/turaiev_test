import 'package:flutter/material.dart';
import 'package:turaiev_test/global/ui/colors.dart';

class CustomTextStyle extends TextStyle {
  const CustomTextStyle({
    Color color = CustomColors.black,
    double height = 1,
    double fontSize = 14.0,
    FontStyle fontStyle = FontStyle.normal,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = 'Ubuntu',
  }) : super(
    color: color,
    height: height,
    fontSize: fontSize,
    fontStyle: fontStyle,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );

  const CustomTextStyle.headline1({
    Color color = CustomColors.black,
    double height = 1,
    double fontSize = 18.0,
    FontStyle fontStyle = FontStyle.normal,
    FontWeight fontWeight = FontWeight.w700,
    String fontFamily = 'Ubuntu',
  }) : super(
    color: color,
    height: height,
    fontSize: fontSize,
    fontStyle: fontStyle,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );

  const CustomTextStyle.headline2({
    Color color = CustomColors.black,
    double height = 1,
    double fontSize = 16.0,
    FontStyle fontStyle = FontStyle.normal,
    FontWeight fontWeight = FontWeight.w500,
    String fontFamily = 'Ubuntu',
  }) : super(
    color: color,
    height: height,
    fontSize: fontSize,
    fontStyle: fontStyle,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}