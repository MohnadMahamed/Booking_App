import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
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
    var cubit = HotelCubit.get(context);
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallHeadLineText(
                size: Dimensions.font20, text: cubit.hotelDetails!.name!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SmallText(
                    text: cubit.hotelDetails!.address!,
                    maxLines: 2,
                  ),
                ),
                Column(
                  children: [
                    SmallHeadLineText(
                      size: Dimensions.font20,
                      text: "\$ ${cubit.hotelDetails!.price!}",
                    ),
                    const SmallText(
                      text: "/per night",
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
