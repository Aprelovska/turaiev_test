import 'package:flutter/material.dart';
import 'package:turaiev_test/global/ui/colors.dart';
import 'package:turaiev_test/global/ui/text_style.dart';

class CustomButton extends TextButton {
  CustomButton({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonStyle? style,
  }) :
      super(
        key: key,
        onPressed: onPressed,
        child: child,
        style: style?.merge(TextButton.styleFrom(
          backgroundColor: CustomColors.white,
          textStyle: const CustomTextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          side: BorderSide(
            color: CustomColors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        )),
      );

  CustomButton.cancel({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonStyle? style,
  }) :
      super(
        key: key,
        onPressed: onPressed,
        child: child,
        style: style?.merge(TextButton.styleFrom(
          backgroundColor: CustomColors.backgroundGrey,
          textStyle: const CustomTextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        )),
      );
      // super(
      //   key: key,
      //   onPressed: onPressed,
      //   child: child,
      //   style: style?.merge(TextButton.styleFrom(
      //     textStyle: const CustomTextStyle(
      //       fontSize: 14.0,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   )),
      // );

  // @override
  // Widget build(BuildContext context) {
  //   final hm = TextButton.styleFrom(
  //     side: BorderSide(
        
  //     ),
  //   );
  //   final style = enabled ? TextButton.styleFrom(
  //     backgroundColor: CustomColors.white,
  //   ) : TextButton.styleFrom(
  //     backgroundColor: CustomColors.backgroundGrey,
  //   );

  //   return TextButton(
  //     onPressed: onPressed,
  //     child: child,
  //     style: style,
  //   );
  // }
}