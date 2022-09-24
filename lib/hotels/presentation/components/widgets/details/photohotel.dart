import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoOfHotel extends StatefulWidget {
  const PhotoOfHotel({Key? key}) : super(key: key);

  @override
  State<PhotoOfHotel> createState() => _PhotoOfHotelState();
}

class _PhotoOfHotelState extends State<PhotoOfHotel> {
  @override
  Widget build(BuildContext context) {
    var cubit=HotelCubit.get(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SizedBox(
          height: 100,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      //color: Colors.red,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    // child: Image.asset(
                    //   'assets/images/1.jpg',
                    //   height: double.infinity,
                    //   width: double.infinity,
                    //   fit: BoxFit.fill,
                    // ),
                    child: Image(
                      image: NetworkImage("http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                  ),

              separatorBuilder: (context, index) => const SizedBox(width: 20,),
              itemCount: 5
          ),
        );
      },
    );
  }
}
