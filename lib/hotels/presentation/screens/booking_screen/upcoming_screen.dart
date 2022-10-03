import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/empty_list.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/widgets/booking_item_widget.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

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
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(top: Dimensions.height20),
                      child: BookingItemWidget(
                        onDotTap: () {
                          updateBookingAlert(
                              not: 'upcome',
                              context: context,
                              func: cubit.updateBookings(
                                  "cancelled",
                                  cubit.listOfUpcomingBooking[index]
                                      .bookingId!));
                        },
                        onTap: () {
                          // cubit.updateBookings("cancelled", cubit.allHotelsData!.hotelData![index].id!);

                          cubit.getDetails(index);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailsScreen(),
                              ));
                        },
                        hotelImage: (cubit
                                .listOfUpcomingBooking[index]
                                .hotelDetailsForBookingModel!
                                .hotelImages!
                                .isEmpty)
                            ? const Image(
                                image: AssetImage("assets/images/no.png"),
                                fit: BoxFit.cover,
                              )
                            : Image(
                                image: NetworkImage(
                                    "http://api.mahmoudtaha.com/images/${cubit.listOfUpcomingBooking[index].hotelDetailsForBookingModel!.hotelImages![0].image!}"),
                                fit: BoxFit.cover,
                              ),
                        hotelName: cubit.listOfUpcomingBooking[index]
                            .hotelDetailsForBookingModel!.name!,
                        hotelAddress: cubit.listOfUpcomingBooking[index]
                            .hotelDetailsForBookingModel!.address!,
                        hotelPrice:
                            '\$${cubit.listOfUpcomingBooking[index].hotelDetailsForBookingModel!.price!}',
                        hotelRate: cubit.listOfUpcomingBooking[index]
                            .hotelDetailsForBookingModel!.rate!,
                      ),
                    ),
                    itemCount: cubit.listOfUpcomingBooking.length,
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
