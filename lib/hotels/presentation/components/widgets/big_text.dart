import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;
  const BigText(
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
      style: Theme.of(context).textTheme.headline2
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
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
