import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final double height;
  final int maxLines;
  const SmallText(
      {Key? key,
      this.color = Colors.white70,
      required this.text,
      this.size = 0,
      this.height = 1.1,
      this.maxLines = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines == 0 ? 2 : maxLines,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            height: height, fontSize: size == 0 ? Dimensions.font16 : size)

        // GoogleFonts.kanit(
        //     height: height,
        //     color: color,
        //     fontSize: size == 0 ? 20 : size,
        //   ),

        );
  }
}
