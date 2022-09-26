import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';

class BookingItemWidget extends StatelessWidget {
  final void Function() onTap;
  final Widget hotelImage;
  final String hotelName;
  final String hotelAddress;
  final String hotelPrice;

  const BookingItemWidget(
      {super.key,
      required this.onTap,
      required this.hotelImage,
      required this.hotelName,
      required this.hotelAddress,
      required this.hotelPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white.withOpacity(.1),
          ),
          child: Column(
            children: [
              //hotel photo
              SizedBox(
                height: 170,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(Dimensions.width15),
                    topEnd: Radius.circular(Dimensions.width15),
                  ),
                  child: hotelImage,
                ),
              ),
              //hotel info
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.width10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                size: Dimensions.font12 * 2,
                                text: hotelName,
                              ),
                              SizedBox(
                                height: Dimensions.height10 / 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SmallText(
                                    size: Dimensions.font20,
                                    text: hotelAddress,
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10 / 2.0,
                                  ),
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.teal,
                                    size: Dimensions.iconSize24,
                                  ),
                                  SmallText(
                                    text: '40.0 Km to city',
                                    size: Dimensions.font16,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10 / 2,
                              ),
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
                                ],
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SmallText(
                                color: Colors.white,
                                text: hotelPrice,
                              ),
                              SmallText(
                                text: '/per night',
                                size: Dimensions.font20,
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
            ],
          ),
        ),
      ),
    );
  }
}
