// import 'dart:async';
//
//
// import 'package:booking_app/hotels/presentation/layout/layout.dart';
// import 'package:booking_app/hotels/presentation/screens/login_screen/login_screen.dart';
// import 'package:booking_app/hotels/presentation/screens/on_boarding/on_boarding_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../../../data/datasource/network/local/shared_preferences.dart';
// class SplashView extends StatefulWidget {
//   static const routeName = 'SplashView';
//
//   const SplashView({Key? key}) : super(key: key);
//
//   @override
//   _SplashViewState createState() => _SplashViewState();
// }
//
// class _SplashViewState extends State<SplashView> {
//   Timer? _timer;
//   //AppPreferences _appPreferences = sl<AppPreferences>();
//
//   _startDelay() {
//     _timer = Timer(Duration(seconds: 2), _goNext);
//   }
//
//   _goNext() async {
//
//     bool onborading = CacheHelper.getData(key: 'onBoarding') ?? false;
//     String token = CacheHelper.getData(key: 'token');
//     if(onborading ==true){
//       if (token != null){
//         Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
//       } else Navigator.pushReplacementNamed(context, LoginScreen.routeName);
//     }
//     else  Navigator.pushReplacementNamed(context, OnBoradingScreen.routeName);
//
//
//     // _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
//     //   if (isUserLoggedIn)
//     //     {
//     //
//     //       Navigator.pushReplacementNamed(context, LayoutScreen.routeName)
//     //     }
//     //   else
//     //     {
//     //       _appPreferences
//     //           .isOnBoardingScreenViewed()
//     //           .then((isOnBoardingScreenViewed) => {
//     //         if (isOnBoardingScreenViewed)
//     //           {
//     //             Navigator.pushReplacementNamed(
//     //                 context, LoginScreen.routeName)
//     //           }
//     //         // else
//     //         //   {
//     //         //     Navigator.pushReplacementNamed(
//     //         //         context, LoginScreen.routeName)
//     //         //   }
//     //       })
//     //     }
//     // });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _startDelay();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: ColorManager.primary,
//       body: Center(
//         child: Image(
//           image: AssetImage("assets/images/1.jpg"),
//         ),
//       ),
//     );
//   }
// }