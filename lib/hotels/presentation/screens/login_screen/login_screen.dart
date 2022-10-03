import 'package:booking_app/core/network/error_message_model.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
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

import '../../../../core/error/exceptions.dart';
import '../../../data/datasource/network/local/shared_preferences.dart';
import '../../../domain/entity/hotel_entity.dart';

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
      listener: (context, state) {
        // if  (state is UserLoginSuccessState )
        // {
        //   ScaffoldMessenger.of(context).showSnackBar(HotelCubit.snackBar);
        //   Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
        //
        //   }
        //
        // else
        //   {
        //     ScaffoldMessenger.of(context).showSnackBar(HotelCubit.snackBar);
        //
        //
        //   }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            //backgroundColor: HotelCubit.get(context).isDark ?AppColors.backGroundColor   :Colors.white,

            //backgroundColor: AppColors.backGroundColor,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10 / 5),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: Dimensions.width30 * 2,
                      height: Dimensions.width30 * 2,
                      decoration: BoxDecoration(
                          color: HotelCubit.get(context).isDark
                              ? Colors.grey[200]
                              : Colors.black87,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RegisterScreen.routeName);
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            size: Dimensions.iconSize30 * 1.2,
                            color: cubit.isDark
                                ? Colors.black
                                : AppColors.mainColor,
                          )),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    child: BigText(
                      text: LocaleKeys.login.tr(),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          //faceBook and gmail
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  child: Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    height: Dimensions.height30 * 1.7,
                                    decoration: BoxDecoration(
                                      color: AppColors.faceBackGroundColor,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20 * 2),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/facebook.png',
                                          width: Dimensions.iconSize16 * 2.5,
                                          height: Dimensions.iconSize16 * 2.5,
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10 / 2,
                                        ),
                                        StaticColorText(
                                          text: LocaleKeys.facebook.tr(),
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
                                    height: Dimensions.height30 * 1.7,
                                    decoration: BoxDecoration(
                                      color: AppColors.gmailBackGroundColor,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20 * 2),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/gmail.png',
                                          width: Dimensions.iconSize16 * 2.5,
                                          height: Dimensions.iconSize16 * 2.5,
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10 / 2,
                                        ),
                                        StaticColorText(
                                          text: LocaleKeys.gmail.tr(),
                                        ),
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
                            height: Dimensions.height20,
                          ),
                          Center(
                            child: SmallHeadLineText(
                              size: Dimensions.font20,
                              text: LocaleKeys.or.tr(),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //email
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width15),
                                child: SmallText(
                                  text: LocaleKeys.email.tr(),
                                  size: Dimensions.font12 + 2,
                                ),
                              ),
                              myForm(
                                TextColor: HotelCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.white70,
                                hitTextColor: HotelCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.white38,
                                fillColor: HotelCubit.get(context).isDark
                                    ? Colors.transparent
                                    : AppColors.myTFFColor,
                                colorsBorderSide: HotelCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.transparent,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return LocaleKeys.email_must_not_be_empty
                                        .tr();
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return LocaleKeys.please_a_valid_Email.tr();
                                  }
                                },
                                type: TextInputType.emailAddress,
                                controller: cubit.emailController,
                                hintText: LocaleKeys.enter_your_email.tr(),
                              ),
                              SizedBox(
                                height: Dimensions.height15,
                              ),
                              //password
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width15),
                                child: SmallText(
                                  text: LocaleKeys.password_hint.tr(),
                                  size: Dimensions.font12 + 2,
                                ),
                              ),
                              myForm(
                                TextColor: HotelCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.white70,
                                hitTextColor: HotelCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.white38,
                                fillColor: HotelCubit.get(context).isDark
                                    ? Colors.transparent
                                    : AppColors.myTFFColor,
                                colorsBorderSide: HotelCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.transparent,
                                isPassword: cubit.isPassword,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changPassVisibility();
                                      print(cubit.isPassword);
                                    },
                                    icon: Icon(
                                      cubit.passwordSuffix,
                                      color: HotelCubit.get(context).isDark
                                          ? Colors.black
                                          : Colors.white38,
                                    )),
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return LocaleKeys.Password_must_not_be_empty
                                        .tr();
                                  }
                                },
                                type: TextInputType.visiblePassword,
                                controller: cubit.passwordController,
                                hintText: LocaleKeys.enter_password.tr(),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {},
                                    child: SmallText(
                                      size: Dimensions.font12,
                                      text:
                                          LocaleKeys.forget_your_password.tr(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              MyButtonWidget(
                                isPadding: false,
                                text: LocaleKeys.login.tr(),
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    showToast(
                                        text: 'Login success',
                                        state: ToastStates.SUCCESS);
                                    Navigator.pushReplacementNamed(
                                        context, LayoutScreen.routeName);

                                    cubit.login(LoginRequestModel(
                                        email: cubit.emailController.text,
                                        password:
                                            cubit.passwordController.text));
                                    CacheHelper.saveData(
                                        key: 'email',
                                        value: cubit.emailController.text);
                                    CacheHelper.saveData(
                                        key: 'password',
                                        value: cubit.passwordController.text);
                                    cubit.emailController.text = '';
                                    cubit.passwordController.text = '';

                                    //print(CacheHelper.getData(key: 'token'));
                                    cubit.getAllHotels(1);
                                    // Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
                                  }
                                },
                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // bool loading = false;
}
