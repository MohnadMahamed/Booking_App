import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class PhotoOfHotel extends StatefulWidget {
  const PhotoOfHotel({Key? key}) : super(key: key);

  @override
  State<PhotoOfHotel> createState() => _PhotoOfHotelState();
}

class _PhotoOfHotelState extends State<PhotoOfHotel> {
  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: Dimensions.height15 * 10,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: Dimensions.width15 * 10,
                    // height: 400,
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image(
                      image: NetworkImage(
                          // "http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                          "http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![math.Random().nextInt(cubit.hotelDetails!.hotelImages!.length)].image!}"),

                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: Dimensions.width15,
                  ),
              itemCount: 5),
        );
      },
    );
  }
}
