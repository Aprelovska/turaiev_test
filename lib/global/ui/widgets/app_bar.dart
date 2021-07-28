import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:turaiev_test/global/ui/text_style.dart';
import 'package:turaiev_test/global/ui/widgets/divider.dart';
import 'package:turaiev_test/global/ui/colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Widget? leading,
    Widget? title,
    List<Widget>? actions,
  }) : super(
    centerTitle: true,
    key: key,
    leading: leading,
    title: title,
    actions: actions,
    backgroundColor: CustomColors.transparent,
    elevation: 0.0,
    bottom: const CustomDivider.vertical(
      indent: 12.0,
    ),
  );

  factory CustomAppBar.page({
    Key? key,
    required String title,
    List<Widget>? actions,
  }) => CustomAppBar(
    key: key,
    leading: null, // TODO
    title: Text(title,
      style: const CustomTextStyle.headline1(),
    ),
    actions: actions,
  );

  factory CustomAppBar.modal({
    Key? key,
    Widget? title,
    List<Widget>? actions,
  }) => CustomAppBar(
    key: key,
    leading: null, // TODO
    title: title,
    actions: actions,
  );
}