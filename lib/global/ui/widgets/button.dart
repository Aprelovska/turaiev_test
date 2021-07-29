import 'package:flutter/material.dart';
import 'package:turaiev_test/global/ui/colors.dart';
import 'package:turaiev_test/global/ui/text_style.dart';

class CustomButton extends TextButton {
  CustomButton({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonStyle style = const ButtonStyle(),
  }) :
      super(
        key: key,
        onPressed: onPressed,
        child: child,
        style: style.merge(defaultStyle),
      );

  CustomButton.cancel({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonStyle style = const ButtonStyle(),
  }) :
      super(
        key: key,
        onPressed: onPressed,
        child: child,
        style: style.merge(CustomButton.styleFrom(
          side: BorderSide.none,
          backgroundColor: CustomColors.backgroundGrey,
        )).merge(defaultStyle),
      );
    
  static final ButtonStyle defaultStyle = styleFrom(
    primary: CustomColors.black,
    backgroundColor: CustomColors.white,
    textStyle: const CustomTextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    side: const BorderSide(
      color: CustomColors.grey,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 8.0,
    ),
  );

  static ButtonStyle styleFrom({
    Color? primary,
    Color? backgroundColor,
    CustomTextStyle? textStyle,
    BorderSide? side,
    OutlinedBorder? shape,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
  }) {
    return TextButton.styleFrom(
      primary: primary,
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      side: side,
      shape: shape,
      alignment: alignment,
      padding: padding,
    );
  }
}