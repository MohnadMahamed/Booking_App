import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
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
    return SizedBox(
      width: double.infinity,
      height: 230,
      child: Card(
        color:
        HotelCubit.get(context).isDark? Colors.white70.withOpacity(.1): Colors.black54.withOpacity(.2),

        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text('8.8',style: TextStyle(color: Colors.teal,fontSize: 30),),
                 // BigText(text: '8.8', color: Colors.teal),
                  SizedBox(
                    width: 10,
                  ),
                  SmallText(
                    text: 'Overall rating',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmallText(
                    text: 'Room',
                    size: Dimensions.font12 * 2,
                  ),
                  const SizedBox(
                    width: 20,
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
                  SmallText(
                    text: 'Services',
                    size: Dimensions.font12 * 2,
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
                  SmallText(
                    text: 'Price',
                    size: Dimensions.font12 * 2,
                  ),
                  const SizedBox(
                    width: 26,
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
    );
    
  }
}
