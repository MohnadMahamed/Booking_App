import 'package:booking_app/core/animation/fade_animation.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';

class HotelItemWidget extends StatelessWidget {
  final void Function() onTap;
  final Widget hotelImage;
  final String hotelName;
  final String hotelAddress;
  final String hotelPrice;
  final String hotelRate;

  const HotelItemWidget({
    super.key,
    required this.onTap,
    required this.hotelImage,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelPrice,
    required this.hotelRate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
      child: InkWell(
        onTap: onTap,
        child: Container(
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
            borderRadius: BorderRadiusDirectional.all(
                Radius.circular(Dimensions.radius15)),
            color: HotelCubit.get(context).isDark
                ? Colors.grey[200]
                : Colors.black87,
          ),
          height: Dimensions.hotelItemHeight - 10,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    height: Dimensions.hotelItemHeight,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(17),
                        bottomStart: Radius.circular(17),
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(17),
                          bottomStart: Radius.circular(17),
                        ),
                        child: hotelImage)),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.width10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeAnimation(
                            1,
                            child: BigText(
                              text: hotelName,
                            ),
                          ),
                          FadeAnimation(
                            1.3,
                            child: SmallText(
                              text: hotelAddress,
                              size: Dimensions.font16,
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      FadeAnimation(
                        1.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     Icon(
                                  //       Icons.location_pin,
                                  //       color: Colors.teal,
                                  //       size: Dimensions.iconSize16,
                                  //     ),
                                  //     SizedBox(
                                  //       width: Dimensions.width10 / 3,
                                  //     ),
                                  //     const SmallText(
                                  //       text: '40.0 Km',
                                  //     ),
                                  //   ],
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.teal,
                                        size: Dimensions.iconSize16 * 1.5,
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10 / 3,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: SmallText(
                                          text: hotelRate,
                                          size: Dimensions.font20 - 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SmallHeadLineText(
                                  text: hotelPrice,
                                ),
                                const SmallText(
                                  text: 'per night',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height15,
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
  }
}
