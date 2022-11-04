import 'package:booking_app/core/animation/fade_animation.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';

class BookingItemWidget extends StatelessWidget {
  final void Function() onTap;
  final void Function() onDotTap;
  final Widget hotelImage;
  final String hotelName;
  final String hotelAddress;
  final String hotelPrice;
  final String hotelRate;

  const BookingItemWidget(
      {super.key,
      required this.onTap,
      required this.hotelImage,
      required this.hotelName,
      required this.hotelAddress,
      required this.hotelPrice,
      required this.hotelRate,
      required this.onDotTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: Dimensions.bookingItemHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: HotelCubit.get(context).isDark
                        ? Colors.black12
                        : Colors.white12,
                    blurRadius: 5.0,
                    offset: const Offset(0, 5),
                  ),
                ],

                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: HotelCubit.get(context).isDark
                    ? Colors.grey[200]
                    : Colors.black87,

                //  Colors.white.withOpacity(.1),
              ),
              child: Column(
                children: [
                  //hotel photo

                  Expanded(
                    child: FadeAnimation(
                      .2,
                      child: SizedBox(
                        // height: 170,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(Dimensions.width15),
                            topEnd: Radius.circular(Dimensions.width15),
                          ),
                          child: hotelImage,
                        ),
                      ),
                    ),
                  ),
                  //hotel info
                  Expanded(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                .4,
                                child: SmallHeadLineText(
                                  size: Dimensions.font20,
                                  text: hotelName,
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height10 / 2,
                              ),
                              FadeAnimation(
                                .6,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SmallText(
                                            maxLines: 2,
                                            text: hotelAddress,
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10 / 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.teal,
                                                size:
                                                    Dimensions.iconSize16 * 1.5,
                                              ),
                                              SizedBox(
                                                width: Dimensions.width10 / 5,
                                              ),
                                              SmallText(
                                                text: hotelRate,
                                              ),
                                              SizedBox(
                                                width: Dimensions.width10,
                                              ),
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.teal,
                                                size:
                                                    Dimensions.iconSize16 * 1.5,
                                              ),
                                              SizedBox(
                                                width: Dimensions.width10 / 5,
                                              ),
                                              const SmallText(
                                                text: '40.0 Km',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10 / 2,
                                    ),
                                    Column(
                                      children: [
                                        SmallHeadLineText(
                                          size: Dimensions.font20,
                                          text: hotelPrice,
                                        ),
                                        const SmallText(
                                          text: '/per night',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 35,
          top: 25,
          child: InkWell(
              onTap: onDotTap,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: Dimensions.width20 * 2,
                width: Dimensions.width20 * 2,
                child: const Center(
                  child: SmallHeadLineText(
                    text: '...',
                    color: Colors.black,
                  ),
                ),
              )),
        )
      ],
    );
  }
}
