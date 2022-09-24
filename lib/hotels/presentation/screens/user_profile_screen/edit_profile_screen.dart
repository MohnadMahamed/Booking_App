import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolling_switch/rolling_switch.dart';

var userNameController = TextEditingController();
var emailController = TextEditingController();

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
              padding: const EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: Dimensions.width30 * 2,
                  height: Dimensions.height30 * 2,
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
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
                        CircleAvatar(
                          radius: Dimensions.radius83,
                          backgroundColor: AppColors.mainColor,
                          child: CircleAvatar(
                            backgroundImage: const AssetImage(
                              'assets/me.jpg',
                            ),
                            radius: Dimensions.radius83,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 1,
                          child: InkWell(
                            onTap: () {
                              print('change photo');
                            },
                            child: Container(
                              width: Dimensions.width20 * 2.5,
                              height: Dimensions.height20 * 2.5,
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
                              const SmallText(text: 'User Name'),
                              SizedBox(
                                width: Dimensions.width30,
                              ),
                              Expanded(
                                child: editTextFormFeild(
                                    controller: userNameController,
                                    type: TextInputType.name,
                                    hintText: 'Mohnad Mahamed'),
                              ),
                            ],
                          ),
                          myDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SmallText(text: 'Email'),
                              SizedBox(
                                width: Dimensions.width30,
                              ),

                              Expanded(
                                child: editTextFormFeild(
                                    controller: emailController,
                                    type: TextInputType.emailAddress,
                                    hintText: 'mohnad_mahamed@gmail.com'),
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
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const MyButtonWidget(text: 'Apply')),
          ],
        ),
      ),
    );
  }
}
