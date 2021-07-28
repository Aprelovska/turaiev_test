import 'package:flutter/material.dart';
import 'package:turaiev_test/global/ui/colors.dart';

enum DividerOrientation {
  vertical,
  horizontal,
}

class CustomDivider extends StatelessWidget implements PreferredSizeWidget {
  const CustomDivider({
    Key? key,
    this.color = CustomColors.backgroundGrey,
    required this.orientation,
    required this.thickness,
    this.indent = 0.0, // TODO fix indent doesnt work
    this.spacing = 0.0,
  }) : super(key: key);

  const CustomDivider.vertical({
    Key? key,
    this.color = CustomColors.backgroundGrey,
    double height = 2.0,
    this.indent = 0.0,
    this.spacing = 0.0,
  }) :
    orientation = DividerOrientation.vertical,
    thickness = height,
    super(key: key);

  const CustomDivider.horizontal({
    Key? key,
    this.color = CustomColors.backgroundGrey,
    double width = 2.0,
    this.indent = 0.0,
    this.spacing = 0.0,
  }) :
    orientation = DividerOrientation.horizontal,
    thickness = width,
    super(key: key);

  final Color color;
  final DividerOrientation orientation;
  final double thickness;
  final double indent;
  final double spacing;

  double get width => orientation == DividerOrientation.horizontal ? thickness : double.infinity;
  double get height => orientation == DividerOrientation.vertical ? thickness : double.infinity;

  double get horizontalIndent => orientation == DividerOrientation.vertical ? indent : 0.0;
  double get verticalIndent => orientation == DividerOrientation.horizontal ? indent : 0.0;

  double get horizontalSpacing => orientation == DividerOrientation.horizontal ? spacing : 0.0;
  double get verticalSpacing => orientation == DividerOrientation.vertical ? spacing : 0.0;

  @override
  Size get preferredSize => Size(width + horizontalSpacing * 2,  height + verticalSpacing * 2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalSpacing,
        vertical:  verticalSpacing,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: horizontalIndent,
            vertical:  verticalIndent,
          ),
          color: color,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}