import 'dart:async';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:booking_app/hotels/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/datasource/network/local/shared_preferences.dart';
import '../../../data/models/hotle_models.dart';
import '../login_screen/login_screen.dart';



class SplashWidget extends StatefulWidget {
  static const routeName = 'SplashWidget';


  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  Timer? _timer;


  _startDelay() {
    _timer = Timer(Duration(seconds: 3), _goNext);
  }

  _goNext() async {


    bool onborading = CacheHelper.getData(key: 'onBoarding') ?? false;
    String? token = CacheHelper.getData(key: 'token');

    if(onborading ==true){
      if (token != null){
        HotelCubit.get(context).getAllHotels(1);
        LoginRequestModel loginRequestModel =LoginRequestModel(
          email: CacheHelper.getData(key: 'email'),
          password: CacheHelper.getData(key: 'password'),
        );
        HotelCubit.get(context).login(loginRequestModel);

        Navigator.pushReplacementNamed(context, LayoutScreen.routeName);

      } else Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    }
    else  Navigator.pushReplacementNamed(context, OnBoradingScreen.routeName);

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar() ,
      body: Stack(
        children: [
          Container(
            height: double.infinity,

            child: Image.asset(
              'assets/images/3.gif',
              fit: BoxFit.fill,
              // fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
