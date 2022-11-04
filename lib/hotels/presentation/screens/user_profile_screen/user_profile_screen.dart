import 'package:animate_do/animate_do.dart';
import 'package:booking_app/core/animation/fade_animation.dart';
import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/widgets/language_widget.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/widgets/mood_widget.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/edit_profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/network/local/shared_preferences.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = "UserProfileScreen";
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);
    return SafeArea(
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: Scaffold(
              //backgroundColor: AppColors.backGroundColor,
              body: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  FadeAnimation(
                    1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: Dimensions.width30 * 2,
                              height: Dimensions.height30 * 2,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: IconButton(
                                  onPressed: () {
                                    signOut(context);
                                  },
                                  icon: Icon(
                                    Icons.power_settings_new,
                                    size: Dimensions.iconSize30 * 1.3,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
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
                                    navigateeeTo(
                                        context, const EditProfileScreen());
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: Dimensions.iconSize30 * 1.3,
                                    color: AppColors.mainColor,
                                  )),
                            ),
                          ),
                        ),
                      ],
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
                          cubit.userInfo!.image == null
                              ? FadeAnimation(
                                  1.3,
                                  child: CircleAvatar(
                                    radius: Dimensions.radius70,
                                    backgroundColor: AppColors.mainColor,
                                    child: CircleAvatar(
                                      backgroundImage: const AssetImage(
                                          "assets/images/no.png"),
                                      radius: Dimensions.radius73,
                                    ),
                                  ),
                                )
                              : FadeAnimation(
                                  1.3,
                                  child: CircleAvatar(
                                    radius: Dimensions.radius70,
                                    backgroundColor: AppColors.mainColor,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "${cubit.userInfo!.image}",
                                          scale: .5),
                                      radius: Dimensions.radius73,
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Padding(
                            padding: EdgeInsets.all(Dimensions.width20),
                            child: Column(
                              children: [
                                FadeAnimation(
                                  1.6,
                                  child: Row(
                                    children: [
                                      SmallHeadLineText(
                                          text: LocaleKeys.name.tr()),
                                      const Spacer(),
                                      SmallText(
                                        text: cubit.userInfo!.name!,
                                      )
                                    ],
                                  ),
                                ),
                                myDivider(),
                                FadeAnimation(
                                  1.9,
                                  child: Row(
                                    children: [
                                      SmallHeadLineText(
                                          text: LocaleKeys.email.tr()),
                                      const Spacer(),
                                      SmallText(
                                        text: cubit.userInfo!.email!,
                                      )
                                    ],
                                  ),
                                ),
                                myDivider(),
                                const FadeAnimation(2.2, child: MoodWidget()),
                                myDivider(),
                                const FadeAnimation(2.5,
                                    child: LanguageWidget()),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                FadeAnimation(
                                  2.8,
                                  child: MyButtonWidget(
                                      isPadding: false,
                                      text: 'Logout',
                                      onTap: () {
                                        signOut(context);
                                      }),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
