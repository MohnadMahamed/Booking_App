import 'dart:async';
import 'package:booking_app/core/services/services_locator.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:booking_app/hotels/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_prefs.dart';



class SplashWidget extends StatefulWidget {
  static const routeName = 'SplashWidget';


  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  Timer? _timer;
  AppPreferences _appPreferences = sl<AppPreferences>();


  _startDelay() {
    _timer = Timer(Duration(seconds: 3), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
      if (isUserLoggedIn)
        {
          // navigate to main screen
          Navigator.pushReplacementNamed(context, LayoutScreen.routeName)
        }
      else
        {
          _appPreferences
              .isOnBoardingScreenViewed()
              .then((isOnBoardingScreenViewed) => {
            if (isOnBoardingScreenViewed)
              {
                Navigator.pushReplacementNamed(
                    context, OnBoradingScreen.routeName)
              }
            else
              {
                Navigator.pushReplacementNamed(
                    context, RegisterScreen.routeName)
              }
          })
        }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 5), () {
  //    //navigateTo(context, HomeScreen());
  //     Navigator.pushReplacementNamed(context, OnBoradingScreen.routeName);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              'assets/images/3.gif',
             // fit: BoxFit.fill,
            ),
          ),
          // Container(
          //     width: double.infinity,
          //     padding:  EdgeInsets.symmetric(horizontal:16 ,vertical: 10  ),
          //     child:  Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: const [
          //         SizedBox(height: 40.0),
          //         Text(
          //           'Discover the Hotels ',
          //           style: TextStyle(
          //             fontSize: 24.0,color: Colors.white,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         Text(
          //           'in Your City',
          //           style: TextStyle(
          //             fontSize: 24.0,color: Colors.white,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //
          //       ],
          //     ),
          //
          // ),
        ],
      ),
    );
  }
}
