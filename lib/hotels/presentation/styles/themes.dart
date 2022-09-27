import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/util/constaces/app_colors.dart';
import 'colors.dart';

ThemeData darkTheme =ThemeData(
  scaffoldBackgroundColor:AppColors.backGroundColor,
  //Colors.,
  //HexColor('6B7579'),
  primarySwatch: defualtColor,
  appBarTheme: AppBarTheme(
      titleSpacing: 20,

      iconTheme: const IconThemeData(
          color: Colors.white
      ),
      backgroundColor: HexColor('6B7579'),
      elevation: 0.0,
      titleTextStyle:const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ) ,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('6B7579'),
        statusBarIconBrightness: Brightness.light ,

      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defualtColor,
      elevation: 20.0,
      backgroundColor: HexColor('6B7579'),
      unselectedItemColor: Colors.grey
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w900,
          color: Colors.white
      ),
      headline2: TextStyle(
          fontSize: 60.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      headline3: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      headline5: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),

  ),
//  fontFamily: 'Janna',

);
ThemeData lightTheme = ThemeData(
  primarySwatch: defualtColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle:TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ) ,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark ,

      )
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defualtColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 20.0
  ),
  textTheme:
  const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Colors.black
      ),
      headline2: TextStyle(
          fontSize: 60.0,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
    headline3: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
    headline5: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),


  ),

  //fontFamily: 'Janna',


);