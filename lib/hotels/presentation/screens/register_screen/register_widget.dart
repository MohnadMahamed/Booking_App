// import 'package:booking_app/core/util/constaces/app_colors.dart';
// import 'package:booking_app/core/util/constaces/dimensions.dart';
// import 'package:booking_app/hotels/data/models/hotle_models.dart';
// import 'package:booking_app/hotels/presentation/components/components.dart';
// import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
// import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
// import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
// import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
// import 'package:booking_app/hotels/presentation/screens/component/my_buttom.dart';
// import 'package:booking_app/hotels/presentation/screens/home_screen/hotels_main_screen.dart';
// import 'package:booking_app/hotels/presentation/screens/register_screen/register_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../component/my_form.dart';

// class RegisterWidget extends StatelessWidget {
//   RegisterWidget({Key? key}) : super(key: key);

//   var formKey = GlobalKey<FormState>();
//   // bool isPassword = true;
//   String? password;
//   String? confirmPassword;

//   @override
//   Widget build(BuildContext context) {
//     var cubit = HotelCubit.get(context);
//     return BlocConsumer<HotelCubit, HotelState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return SafeArea(
//           child: Scaffold(
//             backgroundColor: AppColors.backGroundColor,
//             body: Padding(
//               padding: EdgeInsets.all(Dimensions.height20),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const BigText(
//                       text: 'Sign Up',
//                     ),
//                     SizedBox(
//                       height: Dimensions.height30,
//                     ),
//                     //faceBook and gmail
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           child: Container(
//                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                             width: Dimensions.width30 * 7,
//                             height: Dimensions.height30 * 2.2,
//                             decoration: BoxDecoration(
//                               color: AppColors.faceBackGroundColor,
//                               borderRadius: BorderRadius.circular(
//                                   Dimensions.radius20 * 2),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   'assets/images/facebook.png',
//                                   width: Dimensions.iconSize16 * 2.5,
//                                   height: Dimensions.iconSize16 * 2.5,
//                                 ),
//                                 SizedBox(
//                                   width: Dimensions.width10 / 2,
//                                 ),
//                                 SmallText(
//                                   text: 'Facebook',
//                                   color: Colors.white,
//                                   size: Dimensions.font12 * 2,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           onTap: () {},
//                         ),
//                         SizedBox(
//                           width: Dimensions.width20,
//                         ),
//                         GestureDetector(
//                           child: Container(
//                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                             width: Dimensions.width30 * 7,
//                             height: Dimensions.height30 * 2.2,
//                             decoration: BoxDecoration(
//                               color: AppColors.gmailBackGroundColor,
//                               borderRadius: BorderRadius.circular(
//                                   Dimensions.radius20 * 2),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   'assets/images/gmail.png',
//                                   width: Dimensions.iconSize16 * 2.5,
//                                   height: Dimensions.iconSize16 * 2.5,
//                                 ),
//                                 SizedBox(
//                                   width: Dimensions.width10 / 2,
//                                 ),
//                                 SmallText(
//                                   text: 'Gmail',
//                                   color: Colors.white,
//                                   size: Dimensions.font12 * 2,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           onTap: () {},
//                         ),
//                       ],
//                     ),

//                     SizedBox(
//                       height: Dimensions.height30,
//                     ),
//                     Center(
//                       child: SmallText(
//                         text: 'or log with email',
//                         size: Dimensions.font12 * 2,
//                       ),
//                     ),
//                     SizedBox(
//                       height: Dimensions.height30,
//                     ),
//                     Expanded(
//                         child: SingleChildScrollView(
//                             physics: const BouncingScrollPhysics(),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // name
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: Dimensions.width15 * 2),
//                                   child: SmallText(
//                                     text: 'Your name',
//                                     size: Dimensions.font12 * 2,
//                                   ),
//                                 ),
//                                 myForm(
//                                   validate: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Name  must  not be empty';
//                                     }
//                                   },
//                                   type: TextInputType.name,
//                                   controller: cubit.nameController,
//                                   hintText: 'Enter your name',
//                                 ),
//                                 SizedBox(
//                                   height: Dimensions.height20,
//                                 ),
//                                 //email
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: Dimensions.width15 * 2),
//                                   child: SmallText(
//                                     text: 'Your Email',
//                                     size: Dimensions.font12 * 2,
//                                   ),
//                                 ),
//                                 myForm(
//                                   validate: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Email must  not be empty';
//                                     }
//                                     if (!RegExp(
//                                             "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                                         .hasMatch(value)) {
//                                       return 'Please a valid Email';
//                                     }
//                                   },
//                                   validation: 'Email must  not be empty',
//                                   type: TextInputType.emailAddress,
//                                   controller: cubit.emailController,
//                                   hintText: 'enter your email',
//                                 ),
//                                 SizedBox(
//                                   height: Dimensions.height20,
//                                 ),
//                                 //password
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: Dimensions.width15 * 2),
//                                   child: SmallText(
//                                     text: 'Password',
//                                     size: Dimensions.font12 * 2,
//                                   ),
//                                 ),
//                                 myForm(
//                                   isPassword: cubit.isPassword,
//                                   suffixIcon: IconButton(
//                                       onPressed: () {
//                                         cubit.changPassVisibility();
//                                         print(cubit.isPassword);
//                                       },
//                                       icon: Icon(
//                                         cubit.passwordSuffix,
//                                         color: Colors.white38,
//                                       )),
//                                   validate: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'password  must  not be empty';
//                                     }
//                                   },
//                                   // validation: 'password must  not be empty',
//                                   type: TextInputType.visiblePassword,
//                                   controller: cubit.passwordController,
//                                   hintText: 'enter password',
//                                 ),
//                                 SizedBox(
//                                   height: Dimensions.height20,
//                                 ),
//                                 //confirm password
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: Dimensions.width15 * 2),
//                                   child: SmallText(
//                                     text: 'Confirm password',
//                                     size: Dimensions.font12 * 2,
//                                   ),
//                                 ),
//                                 myForm(
//                                   isPassword: cubit.isPasswordConfirm,
//                                   suffixIcon: IconButton(
//                                       onPressed: () {
//                                         cubit.changConfirmPassVisibility();
//                                       },
//                                       icon: Icon(
//                                         cubit.confirmSuffix,
//                                         color: Colors.white38,
//                                       )),

//                                   validate: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'password confirm must  not be empty';
//                                     }
//                                     if (cubit.confirmPasswordController.text !=
//                                         cubit.passwordController.text) {
//                                       return ' Password Not match';
//                                     }
//                                   },
//                                   // validation: 'password must  not be empty',
//                                   type: TextInputType.visiblePassword,
//                                   controller: cubit.confirmPasswordController,
//                                   hintText: 'enter confirm password',
//                                 ),
//                                 SizedBox(
//                                   height: Dimensions.height20,
//                                 ),
//                               ],
//                             ))),
//                     //my Buttom
//                     MyButtonWidget(
//                       text: 'Sign Up',
//                       onTap: () {
//                         if (formKey.currentState!.validate()) {
//                           cubit.register(RegisterRequestModel(
//                               name: cubit.nameController.text,
//                               email: cubit.emailController.text,
//                               password: cubit.passwordController.text,
//                               passwordConfirmation:
//                                   cubit.confirmPasswordController.text,
//                               image: ""));
//                           Navigator.pushReplacementNamed(
//                               context, HomeScreen.routeName);
//                         }
//                       },
//                     ),
//                     // SizedBox(
//                     //   height: Dimensions.height10,
//                     // ),
//                     //Text
//                     // Column(
//                     //   children: [
//                     //     Center(
//                     //       child: SmallText(
//                     //         text:
//                     //             'By Signing up, your agreed with our terms of  ',
//                     //         size: Dimensions.font20,
//                     //       ),
//                     //     ),
//                     //     SmallText(
//                     //       text: 'service and privacy policy',
//                     //       size: Dimensions.font20,
//                     //     ),
//                     //     SizedBox(
//                     //       height: Dimensions.height10,
//                     //     )
//                     //   ],
//                     // ),
//                     // //To login
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SmallText(
//                           text: 'Already have account? ',
//                           size: Dimensions.font20,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             // navigateTo(context, const LoginScreen());
//                             Navigator.pushReplacementNamed(
//                                 context, RegisterScreen.routeName);
//                           },
//                           child: SmallText(
//                             text: 'Login',
//                             color: AppColors.mainColor,
//                             size: Dimensions.font20,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
