import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/util/constaces/app_colors.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.backGroundColor,
  //Colors.,
  //HexColor('6B7579'),
  primarySwatch: defualtColor,
  appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: AppColors.backGroundColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.backGroundColor,
        statusBarIconBrightness: Brightness.light,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defualtColor,
      elevation: 20.0,
      backgroundColor: HexColor('6B7579'),
      unselectedItemColor: Colors.grey),
  textTheme: TextTheme(
    bodyText1: GoogleFonts.cairo(
        fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white38),
    bodyText2: GoogleFonts.cairo(
        fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline1: GoogleFonts.kanit(
        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline3: GoogleFonts.kanit(
        fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline5: GoogleFonts.kanit(
        fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
  ),
//  fontFamily: 'Janna',
);
ThemeData lightTheme = ThemeData(
  primarySwatch: defualtColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      )),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defualtColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 20.0),
  textTheme: TextTheme(
    bodyText1: GoogleFonts.cairo(
        fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black54),
    bodyText2: GoogleFonts.cairo(
        fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black87),
    headline1: GoogleFonts.kanit(
        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline3: GoogleFonts.kanit(
        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline5: GoogleFonts.kanit(
        fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.black),
  ),

  //fontFamily: 'Janna',
);
