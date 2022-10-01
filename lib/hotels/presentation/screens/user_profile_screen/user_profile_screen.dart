import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/login_screen/login_screen.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/widgets/language_widget.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/widgets/mood_widget.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/edit_profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/network/local/shared_preferences.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName="UserProfileScreen";
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);
    return SafeArea(
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            //backgroundColor: AppColors.backGroundColor,
            body: Column(
              children: [
                SizedBox(
                  height: Dimensions.height20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: Dimensions.width30 * 2,
                      height: Dimensions.height30 * 2,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: IconButton(
                          onPressed: () {
                            navigateeeTo(context, const EditProfileScreen());
                          },
                          icon: Icon(
                            Icons.edit,
                            size: Dimensions.iconSize30 * 1.3,
                            color: AppColors.mainColor,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        if(cubit.userInfo!.image==null)
                           CircleAvatar(
                          radius: Dimensions.radius70,
                          backgroundColor: AppColors.mainColor,
                          child: CircleAvatar(
                            backgroundImage: const AssetImage("assets/images/no.png"),
                            radius: Dimensions.radius73,
                          ),
                        ),
                        if(cubit.userInfo!.image!=null)
                          CircleAvatar(
                          radius: Dimensions.radius70,
                          backgroundColor: AppColors.mainColor,
                          child: CircleAvatar(
                            backgroundImage:NetworkImage(
                                "http://api.mahmoudtaha.com/images/${cubit.imageUrl}",
                                scale: .5

                                // 'assets/me.jpg',
                                ),
                            radius: Dimensions.radius73,
                          ),
                        ),


                        SizedBox(
                          height: Dimensions.height20 * 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(Dimensions.width20),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment
                                //     .spaceBetween,
                                children: [
                                  SmallHeadLineText(text: LocaleKeys.name.tr()),
                                  const Spacer(),
                                  SmallText(
                                    text: cubit.userInfo!.name!,
                                  )
                                ],
                              ),
                              myDivider(),
                              Row(
                                children: [
                                  SmallHeadLineText(
                                      text: LocaleKeys.email.tr()),
                                  const Spacer(),
                                  SmallText(
                                    text: cubit.userInfo!.email!,
                                  )
                                ],
                              ),
                              myDivider(),
                              const MoodWidget(),
                              myDivider(),
                              const LanguageWidget(),
                              SizedBox(
                                height: Dimensions.height20,
                              ),const SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: 50,
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.teal,
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);

                                   cubit.signOut(context);

                                  },
                                  child: const Text(
                                    'Logout',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
