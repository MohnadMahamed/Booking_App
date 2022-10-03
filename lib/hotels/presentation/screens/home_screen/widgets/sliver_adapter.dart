import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/hotel_item.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

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
                    top: Dimensions.height20, left: Dimensions.width10),
                child: BigText(
                  text: LocaleKeys.other_hotel.tr(),
                  size: Dimensions.font20,
                ),
              ),
              //list of hotel
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: Dimensions.height20,
                ),
                itemBuilder: (context, index) => HotelItemWidget(
                  onTap: () {
                    cubit.getAllFacilities();

                    cubit.getDetails(index);
                    // Navigator.pushNamed(context, DetailsScreen.routeName);
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
                          // 'http://api.mahmoudtaha.com/images/${AppBloc.get(context).hotels[index].images[math.Random().nextInt(AppBloc.get(context).hotels[index].images.length)]}'),

                          image: NetworkImage(
                              "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![math.Random().nextInt(cubit.allHotelsData!.hotelData![index].hotelImages!.length)].image!}"),
                          fit: BoxFit.cover,
                        ),
                  hotelName: cubit.allHotelsData!.hotelData![index].name!,
                  hotelAddress: cubit.allHotelsData!.hotelData![index].address!,
                  hotelPrice:
                      '\$${cubit.allHotelsData!.hotelData![index].price!}',
                  hotelRate: cubit.allHotelsData!.hotelData![index].rate!,
                ),
                itemCount: cubit.allHotelsData!.hotelData!.length,
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
