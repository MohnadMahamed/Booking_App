import 'dart:async';
import 'package:booking_app/hotels/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:booking_app/hotels/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';


class SplashWidget extends StatefulWidget {
  static const routeName = 'SplashWidget';


  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
     //navigateTo(context, HomeScreen());
      Navigator.pushReplacementNamed(context, OnBoradingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              'assets/images/1.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(horizontal:16 ,vertical: 10  ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(height: 40.0),
                  Text(
                    'Discover the Hotels ',
                    style: TextStyle(
                      fontSize: 24.0,color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'in Your City',
                    style: TextStyle(
                      fontSize: 24.0,color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),

          ),
        ],
      ),
    );
  }
}
