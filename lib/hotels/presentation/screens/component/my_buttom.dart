import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? text;
  final Color textColor;
  final double height;
  final double width;
  final double sizeText;
  final VoidCallback onClick;
  final double radius;
  final Color background;

  const MyButton({
    Key? key,
    this.text,
    this.textColor = Colors.white,
    this.height = 52.0,
    this.width = double.infinity,
    required this.onClick,
    this.radius = 25.0,
    this.sizeText = 18.0,
    this.background=Colors.teal,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            radius
        ),
      ),
      child: MaterialButton(
        color: background,
        height: height,
        onPressed: () {
          onClick();
        },
        child: Text(
          text!,
          style: TextStyle(color: textColor,fontSize:sizeText ,fontWeight:FontWeight.normal )
          ,
        ),
      ),
    );
  }
}
