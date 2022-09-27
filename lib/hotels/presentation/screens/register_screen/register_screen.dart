import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/resources/String_manager.dart';
import 'package:booking_app/hotels/presentation/screens/login_screen/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static  String routeName = LocaleKeys.sign_up.tr() ;

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var cubit = HotelCubit.get(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: ()
                {
                  HotelCubit.get(context).changeAppMode();
                },
                    icon: Icon(Icons.brightness_4_outlined)),

              ],
            ),
           // backgroundColor: HotelCubit.get(context).isDark ?AppColors.backGroundColor :Colors.white,
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       BigText(

                  text: LocaleKeys.sign_up.tr(),

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
                                      text:LocaleKeys.facebook.tr(),
                                      color: Colors.white,
                                      size: Dimensions.font12 * 2,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {

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
                                      text: LocaleKeys.gmail.tr(),
                                      color: Colors.white,
                                      size: Dimensions.font12 * 1.7,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Center(
                        child: SmallText(

                        text: LocaleKeys.or.tr(),
                          size: Dimensions.font12* 1.7,

                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),

                      SmallText(
              text: LocaleKeys.user_name.tr(),
                        size: Dimensions.font12 * 1.7,

                      ),
                      myForm(
                        TextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white70,

                        hitTextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white38,
                        fillColor: HotelCubit.get(context).isDark?Colors.transparent :AppColors.myTFFColor ,
                        colorsBorderSide:HotelCubit.get(context).isDark? Colors.black:Colors.transparent ,

                        //Colors.red,

                        validate: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.name_must_not_be_empty.tr() ;
                          }
                        },
                        type: TextInputType.name,
                        controller: cubit.nameController,
                        hintText: LocaleKeys.enter_your_name.tr(),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //email

                      SmallText(
              text:  LocaleKeys.your_email.tr(),
                        size: Dimensions.font12 * 1.7,

                      ),
                      myForm(
                        TextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white70,

                        hitTextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white38,

                        fillColor: HotelCubit.get(context).isDark?Colors.transparent :AppColors.myTFFColor ,

                        colorsBorderSide:HotelCubit.get(context).isDark? Colors.black:Colors.transparent ,

                        validate: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.email_must_not_be_empty.tr();
                          }
                          if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return LocaleKeys.please_a_valid_Email.tr();
                          }
                        },
                        validation: LocaleKeys.please_a_valid_Email.tr(),
                        type: TextInputType.emailAddress,
                        controller: cubit.emailController,
                        hintText: LocaleKeys.enter_your_email.tr(),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //password

                      SmallText(
              text: LocaleKeys.password_hint.tr(),
                        size: Dimensions.font12 * 1.7,

                      ),
                      myForm(
                        TextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white70,

                        hitTextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white38,

                        fillColor: HotelCubit.get(context).isDark?Colors.transparent :AppColors.myTFFColor ,

                        colorsBorderSide:HotelCubit.get(context).isDark? Colors.black:Colors.transparent ,

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
                            return  LocaleKeys.Password_must_not_be_empty.tr();
                          }
                        },
                        // validation: 'password must  not be empty',
                        type: TextInputType.visiblePassword,
                        controller: cubit.passwordController,
                        hintText: LocaleKeys.enter_password.tr(),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //confirm password

                      SmallText(
              text: LocaleKeys.confirm_password.tr(),
                        size: Dimensions.font12 * 1.7,

                      ),
                      myForm(
                        TextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white70,

                        hitTextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white38,

                        fillColor: HotelCubit.get(context).isDark?Colors.transparent :AppColors.myTFFColor ,

                        colorsBorderSide:HotelCubit.get(context).isDark? Colors.black:Colors.transparent ,

                        isPassword: cubit.isPasswordConfirm,
                        suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changConfirmPassVisibility();
                            },
                            icon: Icon(
                              cubit.confirmSuffix,
                              color: Colors.white38,
                            )),

                        validate: (value) {
                          if (value!.isEmpty) {
                            return  LocaleKeys.password_confirm_must_not_be_empty.tr();
                          }
                          if (cubit.confirmPasswordController.text !=
                              cubit.passwordController.text) {
                            return  LocaleKeys.password_not_match.tr();
                          }
                        },
                        // validation: 'password must  not be empty',
                        type: TextInputType.visiblePassword,
                        controller: cubit.confirmPasswordController,
                        hintText:  LocaleKeys.enter_confirm_password.tr(),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      MyButtonWidget(
                        text:  LocaleKeys.sign_up.tr(),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            cubit.register(RegisterRequestModel(
                                name: cubit.nameController.text,
                                email: cubit.emailController.text,
                                password: cubit.passwordController.text,
                                passwordConfirmation:
                                cubit.confirmPasswordController.text,
                                image: ""));
                            Navigator.pushReplacementNamed(
                                context, LayoutScreen.routeName);
                          }
                        },
                      ),
                      //my Buttom
                      // SizedBox(
                      //   height: Dimensions.height10,
                      // ),
                      //Text
                      // Column(
                      //   children: [
                      //     Center(
                      //       child: SmallText(
                      //         text:
                      //             'By Signing up, your agreed with our terms of  ',
                      //         size: Dimensions.font20,
                      //       ),
                      //     ),
                      //     SmallText(
                      //       text: 'service and privacy policy',
                      //       size: Dimensions.font20,
                      //     ),
                      //     SizedBox(
                      //       height: Dimensions.height10,
                      //     )
                      //   ],
                      // ),
                      // //To login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                            text:     LocaleKeys.already_have_account.tr(),
                            size: Dimensions.font20,
                          ),
                          InkWell(
                            onTap: () {
                              // navigateTo(context, const LoginScreen());
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.routeName);
                            },
                            child:  Text(
                              LocaleKeys.login.tr(),
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal
                              ),

                            )
                            // SmallText(
                            //   text: 'Login',
                            //   color: AppColors.mainColor,
                            //   size: Dimensions.font20,
                            // ),
                          ),
                        ],
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
