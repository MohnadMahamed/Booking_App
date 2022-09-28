import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/widgets/sliver_app_bar.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/widgets/sliver_adapter.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static  const routeName = "HomeScreen";
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
                     SliverAdapter(),
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

  List<Widget> buildListView() {
    return [
      BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (cubit.allHotelsData!.hotelData![index].hotelImages![0].image!
                  .isEmpty) {
                return const Image(
                  image: AssetImage("assets/images/no.png"),
                  fit: BoxFit.cover,
                );
              } else {
                return Image(
                  image: NetworkImage(
                      "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![0].image!}"),
                  fit: BoxFit.cover,
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
