import 'package:flutter/material.dart';
import 'package:turaiev_test/global/ui/colors.dart';

class CustomDivider extends StatelessWidget implements PreferredSizeWidget {
  const CustomDivider({
    Key? key,
    this.color = CustomColors.backgroundGrey,
    required this.direction,
    required this.thickness,
    this.indent = 0.0, // TODO fix indent doesnt work
    this.spaceBefore = 0.0,
    this.spaceAfter = 0.0,
  }) : super(key: key);

  const CustomDivider.vertical({
    Key? key,
    this.color = CustomColors.backgroundGrey,
    double height = 2.0,
    this.indent = 0.0,
    this.spaceBefore = 0.0,
    this.spaceAfter = 0.0,
  }) :
    direction = Axis.vertical,
    thickness = height,
    super(key: key);

  const CustomDivider.horizontal({
    Key? key,
    this.color = CustomColors.backgroundGrey,
    double width = 2.0,
    this.indent = 0.0,
    this.spaceBefore = 0.0,
    this.spaceAfter = 0.0,
  }) :
    direction = Axis.horizontal,
    thickness = width,
    super(key: key);

  final Color color;
  final Axis direction;
  final double thickness;
  final double indent;
  final double spaceBefore;
  final double spaceAfter;

  double get width => direction == Axis.horizontal ? thickness : double.infinity;
  double get height => direction == Axis.vertical ? thickness : double.infinity;

  double get horizontalIndent => direction == Axis.vertical ? indent : 0.0;
  double get verticalIndent => direction == Axis.horizontal ? indent : 0.0;

  EdgeInsets get spacing => direction == Axis.vertical ? EdgeInsets.only(
    top: spaceBefore,
    bottom: spaceAfter,
  ) : EdgeInsets.only(
    left: spaceBefore,
    right: spaceAfter,
  );

  @override
  Size get preferredSize => Size(
    width + (direction == Axis.horizontal ? spaceBefore + spaceAfter : 0.0),
    height + (direction == Axis.vertical ? spaceBefore + spaceAfter : 0.0),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: spacing,
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