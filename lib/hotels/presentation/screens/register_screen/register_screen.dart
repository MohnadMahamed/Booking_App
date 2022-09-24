import 'package:booking_app/hotels/presentation/screens/register_screen/register_widget.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {
  static const routeName = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:    RegisterWidget(),
    );
  }
}
