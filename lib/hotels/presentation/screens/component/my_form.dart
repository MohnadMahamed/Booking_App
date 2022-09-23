import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  final String? label;
  final String? validation;
  final TextInputType type;
  final double radius;
  final bool isPassword;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final int maxLength;
  final Function(String? title)? validate;

  const MyForm({
    Key? key,
    this.label,
    this.validate,
     this.validation,
    required this.type,
    required this.controller,
    this.radius = 30,
    this.isPassword = false,
    this.prefix,
    this.suffix,
    this.maxLength = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white60),
      obscureText: isPassword,
      keyboardType: type,
      controller: TextEditingController(),
      validator: (T)=>validate!(T),


      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return validation;
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0XFF2C2C2C),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Colors.teal)),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white38)),
    );
  }
}
