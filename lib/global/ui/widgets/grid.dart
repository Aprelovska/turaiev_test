import 'package:flutter/material.dart';

typedef GridWidgetBuilder = Widget Function(BuildContext context, int mainIndex, int crossIndex);

class CustomGrid extends StatelessWidget {
  const CustomGrid({
    Key? key,
    this.direction = Axis.vertical,
    required this.crossAxisCount,
    required this.itemCount,
    required this.builder,
    this.ratio,
  }) : super(key: key);

  final Axis direction;
  final int crossAxisCount;
  final int itemCount;
  final GridWidgetBuilder builder;
  final double? ratio;

  int get mainAxisCount => itemCount ~/ crossAxisCount + (itemCount % crossAxisCount > 0 ? 1 : 0);

  Axis get oppositeDirection {
    switch (direction) {
      case Axis.vertical: return Axis.horizontal;
      case Axis.horizontal: return Axis.vertical;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final max = constraints.biggest;
        double? width;
        double? height;
        switch (direction) {
          case Axis.vertical: {
            width = max.width / crossAxisCount;
            if (ratio != null) {
              height = width * ratio!;
            }
          } break;
          case Axis.horizontal: {
            height = max.height / crossAxisCount;
            if (ratio == null) {
              width = height * ratio!;
            }
          } break;
        }

        return Flex(
          mainAxisSize: MainAxisSize.min,
          direction: direction,
          children: [
            for (int i = 0; i < mainAxisCount; ++i)
              Flex(
                direction: oppositeDirection,
                children: [
                  for (int j = 0; j < crossAxisCount; ++j)
                    SizedBox(
                      width: width,
                      height: height,
                      child: builder(context, i, j),
                    ),
                ],
              )
          ],
        );
      },
    );
  }
}