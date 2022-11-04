import 'package:booking_app/core/animation/fade_animation.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';

class HotelMapItemWidget extends StatelessWidget {
  final void Function() onTap;
  final Widget hotelImage;
  final String hotelName;
  final String hotelAddress;
  final String hotelPrice;
  final String hotelRate;
  final Color? color;

  const HotelMapItemWidget(
      {super.key,
      required this.onTap,
      required this.hotelImage,
      required this.hotelName,
      required this.hotelAddress,
      required this.hotelPrice,
      required this.hotelRate,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadiusDirectional.all(Radius.circular(Dimensions.radius15)),
          color: color == Colors.white
              ? const Color.fromARGB(255, 27, 22, 22)
              : color,
        ),
        height: Dimensions.hotelMapItemHeight,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: FadeAnimation(
                .7,
                child: Container(
                    height: Dimensions.hotelMapItemHeight,
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
                          .7,
                          child: SmallHeadLineText(
                            size: Dimensions.font16,
                            text: hotelName,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10 / 2,
                        ),
                        FadeAnimation(
                          1.0,
                          child: SmallText(
                            color: Colors.white70,
                            size: Dimensions.font12 + 2,
                            text: hotelAddress,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Dimensions.height10 / 2,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width10 / 1.5),
                                child: FadeAnimation(
                                  1.3,
                                  child: Row(
                                    children: [
                                      SmallHeadLineText(
                                        text: hotelRate,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10 / 2,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.teal,
                                        size: Dimensions.iconSize16 * 1.3,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Dimensions.width10),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SmallHeadLineText(
                                text: hotelPrice,
                                size: Dimensions.font16,
                              ),
                              SmallText(
                                text: '/per night',
                                size: Dimensions.font12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
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
