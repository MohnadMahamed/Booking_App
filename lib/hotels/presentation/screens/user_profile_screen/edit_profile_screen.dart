import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/user_profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:booking_app/hotels/presentation/screens/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);
    return SafeArea(
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: AppColors.backGroundColor,
            body: Column(
              children: [
                SizedBox(
                  height: Dimensions.height20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: Dimensions.width30 * 2,
                      height: Dimensions.height30 * 2,
                      decoration: BoxDecoration(
                          // color: Colors.transparent.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigator.pushReplacementNamed(
                            //     context, UserProfileScreen.routeName);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
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
                        Stack(
                          // alignment: Alignment.bottomRight,
                          children: [
                            if (cubit.userInfo!.image == null)
                              CircleAvatar(
                                radius: Dimensions.radius83,
                                backgroundColor: AppColors.mainColor,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/no.png",
                                  ),
                                  radius: Dimensions.radius83,
                                ),
                              ),
                            if (cubit.userInfo!.image != null)
                              CircleAvatar(
                                radius: Dimensions.radius83,
                                backgroundColor: AppColors.mainColor,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "http://api.mahmoudtaha.com/images/${cubit.imageUrl}",
                                  ),
                                  radius: Dimensions.radius83,
                                ),
                              ),
                            Positioned(
                              bottom: 0,
                              right: 1,
                              child: GestureDetector(
                                onTap: () {
                                  print(LocaleKeys.change_photo.tr);
                                  Navigator.pushNamed(
                                      context, SelectImage.routeName);
                                },
                                child: Container(
                                  width: Dimensions.width20 * 2.5,
                                  height: Dimensions.width20 * 2.5,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20 * 2.5)),
                                  child: Icon(
                                    Icons.photo_camera,
                                    color: AppColors.mainColor,
                                    size: Dimensions.iconSize30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height20 * 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(Dimensions.width20),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallHeadLineText(text: LocaleKeys.name.tr()),
                                  SizedBox(
                                    width: Dimensions.width30,
                                  ),
                                  Expanded(
                                    child: editTextFormFeild(
                                        textColor:
                                            HotelCubit.get(context).isDark
                                                ? Colors.black
                                                : Colors.white70,
                                        controller: userNameController,
                                        type: TextInputType.name,
                                        hintText: cubit.userInfo!.name!),
                                  ),
                                ],
                              ),
                              myDivider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallHeadLineText(
                                      text: LocaleKeys.email.tr()),
                                  SizedBox(
                                    width: Dimensions.width30,
                                  ),

                                  Expanded(
                                    child: editTextFormFeild(
                                        textColor:
                                            HotelCubit.get(context).isDark
                                                ? Colors.black
                                                : Colors.white70,
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        hintText: cubit.userInfo!.email!),
                                  ),
                                  // SmallText(
                                  //   text: 'mohnad_mahamed@gmail.com',
                                  //   size: Dimensions.font20,
                                  //   color: Colors.white,
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyButtonWidget(
                  text: LocaleKeys.apply.tr(),
                  onTap: () {
                    // RegisterRequestModel updateInfo=RegisterRequestModel(name: userNameController.text, email: emailController.text, password: "", passwordConfirmation: "", image: "");

                    cubit.updateUserInfo(userNameController.text,
                        emailController.text, HotelCubit.get(context).image!);
                    cubit.getInfo();

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
