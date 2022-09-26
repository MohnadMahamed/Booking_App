import 'dart:ui';

import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackGroundDetailsPage extends StatefulWidget {
  const BackGroundDetailsPage({Key? key}) : super(key: key);

  @override
  State<BackGroundDetailsPage> createState() => _BackGroundDetailsPageState();
}

class _BackGroundDetailsPageState extends State<BackGroundDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              )),
              //background Image
              child: Image(
                image: NetworkImage(
                    "http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            //card
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 15.0, right: 15.0),
              child: SizedBox(
                height: 220,
                width: double.infinity,
                child: ClipRect(
                  child: Card(
                    color:
                    HotelCubit.get(context).isDark? Colors.white70.withOpacity(.2): Colors.black54.withOpacity(.2),

                   // color: Colors.white70.withOpacity(.2),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 2, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16.0, right: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MediumText(
                            text: cubit.hotelDetails!.name!,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SmallText(
                                        size: Dimensions.font12*1.7 ,
                                        text: cubit.hotelDetails!.address!,
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10 / 1.7,
                                      ),
                                      Icon(
                                        Icons.location_pin,
                                        color: Colors.teal,
                                        size: Dimensions.iconSize24,
                                      ),
                                      SmallText(
                                        text: '40.0 Km to city',
                                        size: Dimensions.font12 * 1.7,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10 ,
                                  ),
                                  //rate
                                  Row(
                                    children: [
                                      Wrap(
                                        children: List.generate(
                                          4,
                                          (index) => Icon(
                                            Icons.star_sharp,
                                            color: AppColors.mainColor,
                                            size: Dimensions.iconSize24,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        color: Colors.teal,
                                        size: Dimensions.iconSize24,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SmallText(
                                        text: '80Reviews',
                                        size: Dimensions.font12 * 1.7,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: "\$ ${cubit.hotelDetails!.price!}",
                                  ),
                                  const SmallText(
                                    text: "/per night,",size: 18,
                                  ),
                                ],
                              )
                            ],
                          ),
                          // const Spacer(),
                          MyButtonWidget(
                            text: 'Book now',
                            height: Dimensions.height30 * 1.8,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //more details
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 550),
                child: SizedBox(
                  height: 55,
                  width: 180,
                  child: Card(
                    color:
                    HotelCubit.get(context).isDark? Colors.white70.withOpacity(.2): Colors.black54.withOpacity(.2),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 2, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallText(
                          text: 'More Details',
                          size: Dimensions.font12 * 2,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: HotelCubit.get(context).isDark? Colors.black: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
