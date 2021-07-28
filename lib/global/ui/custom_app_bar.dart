import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:turaiev_test/global/ui/custom_divider.dart';
import 'package:turaiev_test/resources/colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Widget? leading,
    Widget? title,
    List<Widget>? actions,
  }) : super(
    key: key,
    leading: leading,
    title: title,
    actions: actions,
    backgroundColor: CustomColors.transparent,
    bottom: const CustomDivider.vertical(),
  );

  factory CustomAppBar.page(
    Key? key,
    Widget? title,
    List<Widget>? actions,
  ) => CustomAppBar(
    key: key,
    leading: null, // TODO
    title: title,
    actions: actions,
  );

  factory CustomAppBar.modal(
    Key? key,
    Widget? title,
    List<Widget>? actions,
  ) => CustomAppBar(
    key: key,
    leading: null, // TODO
    title: title,
    actions: actions,
  );
}