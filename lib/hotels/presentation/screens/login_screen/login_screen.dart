import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/hotels/presentation/screens/register_screen/register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var cubit = HotelCubit.get(context);

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.backGroundColor,
            body: Padding(
              padding: EdgeInsets.all(Dimensions.height20),
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: Dimensions.width30 * 1.8,
                          height: Dimensions.height30 * 1.8,
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(50.0)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RegisterScreen.routeName);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: Dimensions.iconSize30 * 1.3,
                                color: AppColors.mainColor,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      const BigText(
                        text: 'Login',
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      //faceBook and gmail
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                width: Dimensions.width30 * 7,
                                height: Dimensions.height30 * 2.2,
                                decoration: BoxDecoration(
                                  color: AppColors.faceBackGroundColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20 * 2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/facebook.png',
                                      width: Dimensions.iconSize16 * 2.5,
                                      height: Dimensions.iconSize16 * 2.5,
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10 / 2,
                                    ),
                                    SmallText(
                                      text: 'Facebook',
                                      color: Colors.white,
                                      size: Dimensions.font12 * 2,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                signInWithFacebook(

                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                width: Dimensions.width30 * 7,
                                height: Dimensions.height30 * 2.2,
                                decoration: BoxDecoration(
                                  color: AppColors.gmailBackGroundColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20 * 2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/gmail.png',
                                      width: Dimensions.iconSize16 * 2.5,
                                      height: Dimensions.iconSize16 * 2.5,
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10 / 2,
                                    ),
                                    SmallText(
                                      text: 'Gmail',
                                      color: Colors.white,
                                      size: Dimensions.font12 * 2,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                loginInWithGoogle();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Center(
                        child: SmallText(
                          text: 'or log with email',
                          size: Dimensions.font12 * 2,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //email
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width15 * 2),
                                child: SmallText(
                                  text: 'Your Email',
                                  size: Dimensions.font12 * 2,
                                ),
                              ),
                              myForm(
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email  must  not be empty';
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return 'Please a valid Email';
                                  }
                                },
                                type: TextInputType.emailAddress,
                                controller: cubit.emailController,
                                hintText: 'enter your email',
                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              //password
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width15 * 2),
                                child: SmallText(
                                  text: 'Password',
                                  size: Dimensions.font12 * 2,
                                ),
                              ),
                              myForm(
                                isPassword: cubit.isPassword,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changPassVisibility();
                                      print(cubit.isPassword);
                                    },
                                    icon: Icon(
                                      cubit.passwordSuffix,
                                      color: Colors.white38,
                                    )),
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password must  not be empty';
                                  }
                                },
                                type: TextInputType.visiblePassword,
                                controller: cubit.passwordController,
                                hintText: 'enter password',
                              ),
                              SizedBox(
                                height: Dimensions.font20,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {},
                                  child: SmallText(
                                      text: 'Forget your password ?',
                                      size: Dimensions.font12 * 2),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height30,
                              ),
                              MyButtonWidget(
                                text: 'Login',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.login(LoginRequestModel(
                                        email: cubit.emailController.text,
                                        password: cubit.passwordController.text
                                    ));
                                    cubit.getAllHotels(1);
                                    Navigator.pushReplacementNamed(
                                        context, LayoutScreen.routeName);
                                  }
                                },
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SmallText(
                                    text: 'Don\'t have an account?',
                                    size: Dimensions.font12 * 2,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, RegisterScreen.routeName);
                                    },
                                    child: SmallText(
                                      text: 'Register',
                                      size: Dimensions.font12 * 2,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
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

  bool loading = false;

  // void signInWithFacebook() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login(
  //         permissions: (['email', 'public_profile']));
  //     final token = result.accessToken!.token;
  //     print(
  //         'Facebook token userID : ${result.accessToken!.grantedPermissions}');
  //     final graphResponse = await http.get(
  //         Uri.parse('https://graph.facebook.com/'
  //             'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
  //     final userData = await FacebookAuth.instance.getUserData();
  //
  //     await FirebaseFirestore.instance.collection('users').add({
  //       'email': userData['email'],
  //       'imageUrl': userData['picture']['data']['url'],
  //       'name': userData['name'],
  //     });
  //     final profile = jsonDecode(graphResponse.body);
  //     print(profile['id']);
  //     print(userData['']);
  //     print("Profile is equal to $profile");
  //     try {
  //       final AuthCredential facebookCredential = FacebookAuthProvider
  //           .credential(result.accessToken!.token);
  //       final userCredential = await FirebaseAuth.instance.signInWithCredential(
  //           facebookCredential);
  //       Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  //     } catch (e) {
  //       final snackBar = SnackBar(
  //         margin: const EdgeInsets.all(20),
  //         behavior: SnackBarBehavior.floating,
  //         content: Text(e.toString()),
  //         backgroundColor: (Colors.redAccent),
  //         action: SnackBarAction(
  //           label: 'dismiss',
  //           onPressed: () {},
  //         ),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //   } catch (e) {
  //     print("error occurred");
  //     print(e.toString());
  //   }
  // }
  void signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: (['email', 'public_profile']));
      final token = result.accessToken!.token;
      print(
          'Facebook token userID : ${result.accessToken!.grantedPermissions}');
      final graphResponse = await http.get(Uri.parse(
          'https://graph.facebook.com/'
          'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
      final userData = await FacebookAuth.instance.getUserData();
      final profile = jsonDecode(graphResponse.body);
      String name = userData["name"];
      String email = userData["email"];
      String password = profile["id"].substring(0, 9);
      String confirmPassword = profile["id"].substring(0, 9);
      RegisterRequestModel registerRequestModel = RegisterRequestModel(
          name: name,
          email: email,
          password: password,
          passwordConfirmation: confirmPassword,
          image: "image");
      HotelCubit.get(context).register(registerRequestModel);

      print(profile['id'].substring(0, 9));
      print(userData['']);
      print("Profile is equal to $profile");
      try {
        // final AuthCredential facebookCredential = FacebookAuthProvider
        //     .credential(result.accessToken!.token);
        // final userCredential = await FirebaseAuth.instance.signInWithCredential(
        //     facebookCredential);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } catch (e) {
        final snackBar = SnackBar(
          margin: const EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString()),
          backgroundColor: (Colors.redAccent),
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print("error occurred");
      print(e.toString());
    }
  }

  void loginInWithGoogle() async {
    setState(() {
      loading = true;
    });
    final googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        setState(() {
          loading = false;
        });
        return;
      }

      final googleSignInAuthentication =
          await googleSignInAccount.authentication;
      String name = googleSignInAccount.displayName!;
      String email = googleSignInAccount.email;
      String password = googleSignInAccount.id;
      String confirmPassword = googleSignInAccount.id;
      RegisterRequestModel registerRequestModel = RegisterRequestModel(
          name: name,
          email: email,
          password: password,
          passwordConfirmation: confirmPassword,
          image: "image");
      HotelCubit.get(context).register(registerRequestModel);
      // print(googleSignInAccount.);
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await FirebaseFirestore.instance.collection('users').add({
        'email': googleSignInAccount.email,
        'imageUrl': googleSignInAccount.photoUrl,
        'name': googleSignInAccount.displayName,
      });
      Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'this account exists with a different sign in provider';
          break;
        case 'invalid -credential':
          content = 'UnKnown error has occurred';
          break;
        case 'operation-not-allowed':
          content = 'this operation is not allowed';
          break;
        case 'user-disabled':
          content = 'the user you tried to log into is disable';
          break;
        case 'user-not-found':
          content = 'the user you tried to log into was not found';
          break;
      }

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('log in with google failed'),
                content: Text(content),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              ));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('log in with google failed'),
                content: Text('An unknow error occurred'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              ));
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
