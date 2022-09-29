import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final int maxLines;
  final TextOverflow overflow;
  const BigText(
      {Key? key,
      this.color = Colors.white,
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis,
      this.maxLines = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines == 0 ? 1 : maxLines,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: size == 0 ? Dimensions.font20 : size, letterSpacing: 1.2)
        // GoogleFonts.kanit(
        //   letterSpacing: 1.2,
        //   color: color,
        //fontSize: size == 0 ? Dimensions.font30 : size,
        //   fontWeight: FontWeight.w700,
        // ),
        );
  }
}

class MediumText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;
  const MediumText(
      {Key? key,
      this.color = Colors.white,
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10),
    );
  }
}
