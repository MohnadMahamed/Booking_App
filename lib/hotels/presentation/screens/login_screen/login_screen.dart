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

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

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
                          GestureDetector(
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
                            onTap: () {},
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          GestureDetector(
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
                            onTap: () {},
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
                                        password:
                                            cubit.passwordController.text));
                                    cubit.getAllHotels(1);
                                    Navigator.pushReplacementNamed(
                                        context, LayoutScreen.routeName);
                                  }
                                },
                              ),
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
}
