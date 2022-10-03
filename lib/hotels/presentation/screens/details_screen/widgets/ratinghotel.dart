import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:flutter/material.dart';

import '../../../controller/hotel_cubit.dart';

class RatingHotel extends StatefulWidget {
  const RatingHotel({Key? key}) : super(key: key);

  @override
  State<RatingHotel> createState() => _RatingHotelState();
}

class _RatingHotelState extends State<RatingHotel> {
  double height = 120;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: .5,
            blurRadius: 1,
            offset: const Offset(0, -.8),
            // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: Dimensions.ratingHotelHeight,
      child: Center(
        child: Card(
          color: HotelCubit.get(context).isDark
              ? Colors.grey[200]
              : Colors.black87,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.transparent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    StaticColorText(
                      text: '8.8',
                      color: Colors.teal,
                      size: Dimensions.font30,
                    ),
                    // BigText(text: '8.8', color: Colors.teal),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    const SmallHeadLineText(
                      text: 'Overall rating',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 40,
                      child: SmallText(
                        text: 'Room',
                      ),
                    ),
                    Slider(
                      activeColor: Colors.teal,
                      autofocus: true,
                      value: height,
                      min: 0,
                      max: 150,
                      onChanged: (value) {
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 40,
                      child: SmallText(
                        text: 'Servic',
                      ),
                    ),
                    Slider(
                      activeColor: AppColors.mainColor,
                      autofocus: true,
                      value: height,
                      min: 20,
                      max: 180,
                      onChanged: (value) {
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 40,
                      child: SmallText(
                        text: 'Price',
                      ),
                    ),
                    Slider(
                      activeColor: Colors.teal,
                      autofocus: true,
                      value: height,
                      min: 0,
                      max: 160,
                      onChanged: (value) {
                        setState(() {});
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
