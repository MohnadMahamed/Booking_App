
// import 'package:flutter/material.dart';


// class CustomButton extends StatelessWidget {
//   final double width;
//   final double height;
//   final double fontSize;
//   final Color buttonColor;
//   final VoidCallback onPressed;
//   final String text;
//   final EdgeInsetsGeometry margin;
//   final FontWeight fontWeight;

//   const CustomButton({Key? key,
//     this.margin = EdgeInsets.zero,
//     this.width = 120,
//     this.height = 30,
//     this.fontWeight = FontWeight.normal,
//     this.fontSize = 20,
//     this.buttonColor = Colors.teal ,
//     required this.onPressed,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: margin,
//       width: width,
//       decoration: BoxDecoration(
//         color: buttonColor,
//         borderRadius: const BorderRadiusDirectional.all(Radius.circular(50)),
//       ),
//       child: MaterialButton(
//         onPressed: onPressed,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50)),
//         height: height,
//         child: Text(
//           text,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: fontSize,
//             fontWeight: fontWeight,

//           ),
//         ),
//       ),
//     );
//   }
// }
