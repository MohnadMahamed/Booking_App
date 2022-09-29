import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/widgets/booking_item_widget.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancelledScreen extends StatelessWidget {
  const CancelledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.backGroundColor,
      body: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //list of hotel
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: Dimensions.height20),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (context, index) => BookingItemWidget(
                        onTap: () {
                          cubit.getDetails(index);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailsScreen(),
                              ));
                        },
                        hotelImage: (cubit.allHotelsData!.hotelData![index]
                                .hotelImages!.isEmpty)
                            ? const Image(
                                image: AssetImage("assets/images/no.png"),
                                fit: BoxFit.cover,
                              )
                            : Image(
                                image: NetworkImage(
                                    "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![0].image!}"),
                                fit: BoxFit.cover,
                              ),
                        hotelName: cubit.allHotelsData!.hotelData![index].name!,
                        hotelAddress:
                            cubit.allHotelsData!.hotelData![index].address!,
                        hotelPrice:
                            '\$${cubit.allHotelsData!.hotelData![index].price!}',
                        hotelRate: cubit.allHotelsData!.hotelData![index].rate!,
                      ),
                      itemCount: cubit.listOfBooking.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
