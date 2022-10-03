import 'dart:async';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
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
    _timer = Timer(Duration(seconds: 5), _goNext);
  }

  _goNext() async {
    bool onborading = CacheHelper.getData(key: 'onBoarding') ?? false;
    String? token = CacheHelper.getData(key: 'token');

    if (onborading == true) {
      if (token != null) {
        HotelCubit.get(context).getAllHotels(1);
        LoginRequestModel loginRequestModel = LoginRequestModel(
          email: CacheHelper.getData(key: 'email'),
          password: CacheHelper.getData(key: 'password'),
        );
        HotelCubit.get(context).login(loginRequestModel);

        Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
      } else
        Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    } else
      Navigator.pushReplacementNamed(context, OnBoradingScreen.routeName);
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
        backgroundColor: const Color(0xff04352d),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/night.jpg',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Align(
                alignment: Alignment.topCenter,
                child: BigText(
                  text: 'Booking Application',
                  size: Dimensions.font20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    BigText(
                      text: 'Created By Team 17',
                      size: Dimensions.font20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
