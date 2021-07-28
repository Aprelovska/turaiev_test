import 'package:flutter/material.dart';
import 'package:turaiev_test/resources/colors.dart';

enum DividerOrientation {
  vertical,
  horizontal,
}

class CustomDivider extends StatelessWidget implements PreferredSizeWidget {
  const CustomDivider({
    Key? key,
    required this.orientation,
    required this.thickness,
    this.indent = 0.0,
  }) : super(key: key);

  const CustomDivider.vertical({
    double height = 2.0,
    this.indent = 0.0,
  }) :
    orientation = DividerOrientation.vertical,
    thickness = height;

  const CustomDivider.horizontal({
    double width = 2.0,
    this.indent = 0.0,
  }) :
    orientation = DividerOrientation.horizontal,
    thickness = width;

  final DividerOrientation orientation;
  final double thickness;
  final double indent;

  double get width => orientation == DividerOrientation.horizontal ? thickness : double.infinity;
  double get height => orientation == DividerOrientation.vertical ? thickness : double.infinity;

  double get horizontalIndent => orientation == DividerOrientation.horizontal ? indent : 0.0;
  double get verticalIndent => orientation == DividerOrientation.vertical ? indent : 0.0;

  @override
  Size get preferredSize => Size(width, height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalIndent,
          vertical:  verticalIndent,
        ),
        color: CustomColors.backgroundGrey,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}