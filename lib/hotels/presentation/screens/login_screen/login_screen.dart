import 'package:booking_app/hotels/presentation/resources/String_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            //backgroundColor: HotelCubit.get(context).isDark ?AppColors.backGroundColor   :Colors.white,

            //backgroundColor: AppColors.backGroundColor,
            body: Padding(
              padding: EdgeInsets.all(Dimensions.height20),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: Dimensions.width30 * 1.8,
                          height: Dimensions.height30 * 1.8,
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(25.0)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RegisterScreen.routeName);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: Dimensions.iconSize30 * 1.2,
                                color: cubit.isDark? Colors.black:AppColors.mainColor ,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(
                        text: LocaleKeys.login.tr(),
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
                                      text:  LocaleKeys.facebook.tr(),
                                      color: Colors.white,
                                      size: Dimensions.font12 * 1.7,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                              //  signInWithFacebook();
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
                                    Text(
                                      LocaleKeys.gmail.tr(),
                                      style:  TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                      ),)
                                  ],
                                ),
                              ),
                              onTap: () {
                                //loginInWithGoogle();
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
                          text:  LocaleKeys.or.tr(),
                          size: Dimensions.font12 * 1.7,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //email

                          SmallText(
                            text: LocaleKeys.email.tr(),
                            size: Dimensions.font12 * 1.7,
                          ),
                          myForm(
                            TextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white70,

                            hitTextColor:HotelCubit.get(context).isDark?Colors.black : Colors.white38,

                            fillColor: HotelCubit.get(context).isDark?Colors.transparent :AppColors.myTFFColor ,

                            colorsBorderSide:HotelCubit.get(context).isDark? Colors.black:Colors.transparent ,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return  LocaleKeys.email_must_not_be_empty.tr();
                              }
                              if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return  LocaleKeys.please_a_valid_Email.tr();
                              }
                            },
                            type: TextInputType.emailAddress,
                            controller: cubit.emailController,
                            hintText: LocaleKeys.enter_your_name.tr(),
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
                                return LocaleKeys.Password_must_not_be_empty.tr();
                              }
                            },
                            type: TextInputType.visiblePassword,
                            controller: cubit.passwordController,
                            hintText: LocaleKeys.enter_password.tr(),
                          ),
                          SizedBox(
                            height: Dimensions.font20,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {},
                              child: SmallText(
                                  text:LocaleKeys.forget_your_password.tr(),
                                  size: Dimensions.font12 * 1.7),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height45,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                            child: MyButtonWidget(

                              isPadding: false,
                              text: LocaleKeys.login.tr(),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.login(LoginRequestModel(
                                      email: cubit.emailController.text,
                                      password: cubit.passwordController.text));
                                  cubit.getAllHotels(1);
                                  Navigator.pushReplacementNamed(
                                      context, LayoutScreen.routeName);
                                }
                              },
                            ),
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

  bool loading = false;
}





