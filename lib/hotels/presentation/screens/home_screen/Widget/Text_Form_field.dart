import 'package:flutter/material.dart';

Widget defaultFormField({
  TextEditingController? controller,
  TextInputType? type,
  Function(String title)? onSubmit,
  Function(String title)? onChange,
  Function(String? title)? validate,
  bool isPassword = false,
  int? Maxlength,
  String? label,
  String? hint,
  IconData? prefix,
  Function()? suffixPressed,
  IconData? suffix,
  Color? color,
  Color? Icon_color,
  Color? border_color,
  Color? border_chang_color,
  double? border ,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      maxLength: Maxlength,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: (T) => validate!(T),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint ,
        labelStyle: TextStyle(
          color: color,

          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          prefix,
          color: Icon_color,
        ),

        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix, color: Icon_color),
        )
            : null,
        enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: border_color!, width: 3.0), borderRadius: BorderRadius.circular(border!), ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: border_chang_color!, width: 3.0),borderRadius: BorderRadius.circular(border),),
      ),
    );