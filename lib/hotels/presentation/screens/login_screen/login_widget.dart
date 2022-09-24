import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/screens/component/my_buttom.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/hotels_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/my_form.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  @override
  void dispose() {

    super.dispose();
  }
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0XFF1A1A1A),
            elevation: 0,
          ),
          backgroundColor: const Color(0XFF1A1A1A),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Your email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white60),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyForm(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Email  must  not be empty';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid Email';
                          }
                        },
                        //validation: 'Email  must  not be empty',
                        type: TextInputType.emailAddress,
                        controller: cubit.emailController,
                        label: 'enter your email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white60),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyForm(
                        isPassword: true,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Password must  not be empty';
                          }
                        },
                        type: TextInputType.visiblePassword,
                        controller: cubit.passwordController,
                        label: 'enter password',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Forget your password ?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white38),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MyButton(
                        text: 'Login',
                        background: Colors.teal,
                        onClick: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login(LoginRequestModel(
                                email: cubit.emailController.text,
                                password: cubit.passwordController.text));
                            cubit.getAllHotels(1);
                            Navigator.pushReplacementNamed(context, HomeScreen.routeName);

                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          'Or',
                          style: TextStyle(fontSize: 16, color: Colors.white60),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        //width: 150.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                width: 150,
                                height: 50,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: Color(0xff1877f2),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/facebook.png',
                                      width: 25.0,
                                      height: 25.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Facebook',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            GestureDetector(
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                width: 150,
                                height: 50,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffb23121),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/gmail.png',
                                      width: 25.0,
                                      height: 25.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Gmail',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}