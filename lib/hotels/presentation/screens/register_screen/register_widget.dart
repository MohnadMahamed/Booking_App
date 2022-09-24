import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/screens/component/my_buttom.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/hotels_main_screen.dart';
import 'package:booking_app/hotels/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/my_form.dart';


class RegisterWidget extends StatelessWidget {
  RegisterWidget({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    var cubit=HotelCubit.get(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0XFF1A1A1A),
            elevation: 0,
          ),
          backgroundColor: const Color(0XFF1A1A1A),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff1877f2),
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
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
                                    'Facebook',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          GestureDetector(
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: 150,
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffb23121),
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
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
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
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                      child: Text(
                        'Or',
                        style: TextStyle(fontSize: 16, color: Colors.white60),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Your name',
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
                          return 'Name  must  not be empty';
                        }
                      },
                      type: TextInputType.emailAddress,
                      controller: cubit.nameController,
                      label: 'enter your name',
                    ),

                    const SizedBox(
                      height: 20,
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
                          return 'Email must  not be empty';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                      },
                      validation: 'Email must  not be empty',
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
                        ' Password',
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
                      isPassword: isPassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'password  must  not be empty';
                        }
                      },
                      // validation: 'password must  not be empty',
                      type: TextInputType.visiblePassword,
                      controller: cubit.passwordController,
                      label: 'enter password',
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        ' Confirm password',
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
                      isPassword: isPassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'password confirm must  not be empty';
                        }if
                        (cubit.confirmPasswordController.text !=cubit.passwordController.text )
                        {
                          return ' Password Not match';
                        }
                      },
                      // validation: 'password must  not be empty',
                      type: TextInputType.visiblePassword,
                      controller:cubit.confirmPasswordController,
                      label: 'enter confirm password',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    MyButton(
                      text: 'Sign up',
                      background: Colors.teal,
                      onClick: () {
                        if (formKey.currentState!.validate()) {
                          cubit.register(
                              RegisterRequestModel(name:cubit.nameController.text, email: cubit.emailController.text, password: cubit.passwordController.text, passwordConfirmation: cubit.confirmPasswordController.text, image: "")


                          );
                          Navigator.pushReplacementNamed(context, HomeScreen.routeName);

                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: const [
                        Center(
                          child: Text(
                            'By Signing up, your agreed with our terms of  ',
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white54,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'service and privacy policy',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white54,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have account? Log in ',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white54,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            // navigateTo(context, const LoginScreen());
                            Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

