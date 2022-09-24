import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelViewDetails extends StatefulWidget {
  const HotelViewDetails({Key? key}) : super(key: key);

  @override
  State<HotelViewDetails> createState() => _HotelViewDetailsState();
}

class _HotelViewDetailsState extends State<HotelViewDetails> {
  @override
  Widget build(BuildContext context) {
    var cubit=HotelCubit.get(context);
    return BlocBuilder<HotelCubit,HotelState>(
      builder: (context, state) {
        return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cubit.hotelDetails!.name!,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children:  [
                    Text(
                      cubit.hotelDetails!.address!,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.add_location,
                      color: Colors.teal,
                      size: 20,
                    ),
                    const Text(
                      '2.0km to city',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children:  [
                Text(
                  "\$ ${cubit.hotelDetails!.price!}",
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "/per night",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
