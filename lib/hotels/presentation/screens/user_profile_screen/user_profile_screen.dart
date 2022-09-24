import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/user_profile/language_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/user_profile/mood_widget.dart';
import 'package:booking_app/hotels/presentation/screens/component/component.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolling_switch/rolling_switch.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
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
                      color: Colors.transparent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: IconButton(
                      onPressed: () {
                        navigateeeTo(context, const EditProfileScreen());
                      },
                      icon: Icon(
                        Icons.edit,
                        size: Dimensions.iconSize30 * 1.5,
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
                    CircleAvatar(
                      radius: Dimensions.radius70,
                      backgroundColor: AppColors.mainColor,
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                          'assets/me.jpg',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SmallText(text: 'User Name'),
                              SmallText(
                                text: 'Mohnad Mahamed',
                                size: Dimensions.font20,
                                color: Colors.white,
                              )
                            ],
                          ),
                          myDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SmallText(text: 'Email'),
                              SmallText(
                                text: 'mohnad_mahamed@gmail.com',
                                size: Dimensions.font20,
                                color: Colors.white,
                              )
                            ],
                          ),
                          myDivider(),
                          const MoodWidget(),
                          myDivider(),
                          const LanguageWidget(),
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
  }
}
