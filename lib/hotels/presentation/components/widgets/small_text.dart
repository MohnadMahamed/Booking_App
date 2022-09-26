import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  const SmallText(

      {Key? key,
      this.color = Colors.white70,
      required this.text,
      this.size = 0,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style:Theme.of(context).textTheme.bodyText1

    // GoogleFonts.kanit(
    //     height: height,
    //     color: color,
    //     fontSize: size == 0 ? 20 : size,
    //   ),

    );
  }
}
