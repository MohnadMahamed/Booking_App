import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen

  ({super.key});

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

                                        TextColor:HotelCubit.get(context).isDark ?Colors.black :Colors.white70,
                                        controller: userNameController,
                                        type: TextInputType.name,
                                        hintText: cubit.loginDataModel!.name!
                                    ),
                                  ),
                                ],
                              ),
                              myDivider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  const SmallText(text: 'Email'),
                                  SizedBox(
                                    width: Dimensions.width30,
                                  ),

                                  Expanded(
                                    child: editTextFormFeild(
                                        TextColor:HotelCubit.get(context).isDark ?Colors.black :Colors.white70,
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        hintText: cubit.loginDataModel!.email!),
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
                  text: 'Apply',
                  onTap: () {
                    // RegisterRequestModel updateInfo=RegisterRequestModel(name: userNameController.text, email: emailController.text, password: "", passwordConfirmation: "", image: "");

                    cubit.updateUserInfo(
                        userNameController.text, emailController.text);
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
