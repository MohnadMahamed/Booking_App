import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/hotel_item.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverAdapter extends StatelessWidget {
  const SliverAdapter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.width20, left: Dimensions.width10),
                child: const BigText(
                  text: 'Other hotel',
                ),
              ),
              //list of hotel
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemBuilder: (context, index) => HotelItemWidget(
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
                  ),
                  itemCount: cubit.allHotelsData!.hotelData!.length,
                ),
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
            ],
          );
        },
      ),
    );
  }
}
