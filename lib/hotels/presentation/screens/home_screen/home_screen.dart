import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/widgets/sliver_app_bar.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/widgets/sliver_adapter.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class HomeScreen extends StatelessWidget {
  static const routeName = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          //backgroundColor: AppColors.backGroundColor,
          body: state is GetAllHotelsSuccessState
              ? CustomScrollView(
                  physics: const ScrollPhysics(),
                  slivers: [
                    SliverApp(
                      images: buildListView(),
                    ),
                    const SliverAdapter(),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                ),
        );
      },
    );
  }

  // List<Widget> buildListView() {
  //   return [
  //     BlocConsumer<HotelCubit, HotelState>(
  //       listener: (context, state) {},
  //       builder: (context, state) {
  //         var cubit = HotelCubit.get(context);
  //         return Stack(
  //
  //                       children: [
  //                         Container(
  //                           height: 1000,
  //                           child: Image(
  //                             image: NetworkImage(
  //                                 // "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![index].image!}"),
  //                                 "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![math.Random().nextInt(cubit.allHotelsData!.hotelData![cubit.pageNumber].hotelImages!.length)].hotelImages![0].image!}"),
  //
  //                             // fit: BoxFit.cover,
  //                           ),
  //                         ),
  //                         Positioned(
  //
  //                             child: Text(cubit.allHotelsData!.hotelData![math.Random().nextInt(cubit.allHotelsData!.hotelData![cubit.pageNumber].hotelImages!.length)].name!),
  //                             // child: Text(cubit.allHotelsData!.hotelData![cubit.pageNumber].name!),
  //                           bottom: 120,
  //                           left: 20,
  //                         )
  //
  //                       ],
  //                     );
  //         return ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           physics: const NeverScrollableScrollPhysics(),
  //           itemBuilder: (context, index) {
  //             if (cubit.allHotelsData!.hotelData![index].hotelImages![index].image!
  //                 .isEmpty) {
  //               return const Image(
  //                 image: AssetImage("assets/images/no.png"),
  //                 fit: BoxFit.cover,
  //               );
  //             } else {
  //               return Image(
  //                 image: NetworkImage(
  //                     // "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![index].image!}"),
  //                     "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![math.Random().nextInt(cubit.allHotelsData!.hotelData![index].hotelImages!.length)].image!}"),
  //
  //                 fit: BoxFit.cover,
  //               );
  //             }
  //           },
  //           itemCount: 1,
  //         );
  //       },
  //     )
  //   ];
  // }
  List<Widget> buildListView() {
    return [
      BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (cubit.allHotelsData!.hotelData![index].hotelImages![index]
                  .image!.isEmpty) {
                return const Image(
                  image: AssetImage("assets/images/no.png"),
                  fit: BoxFit.cover,
                );
              } else {
                return Stack(
                  children: [
                    Image(
                      image: NetworkImage(
                          // "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![index].image!}"),
                          "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![math.Random().nextInt(cubit.allHotelsData!.hotelData![cubit.pageNumber].hotelImages!.length)].hotelImages![0].image!}"),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: Dimensions.height30 * 3,
                      left: Dimensions.width20,
                      child: SizedBox(
                        width: Dimensions.screenWidth - 100,
                        child: StaticColorText(
                          text: cubit
                              .allHotelsData!
                              .hotelData![math.Random().nextInt(
                                  cubit.allHotelsData!.hotelData!.length)]
                              .name!,
                          color: Colors.white,
                          size: Dimensions.font12 * 2,
                          maxLines: 2,
                        ),
                      ),
                    )
                  ],
                );
              }
            },
            itemCount: 1,
          );
        },
      )
    ];
  }
}
