import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  static const routeName = 'LayoutScreen';

  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HotelCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: ConvexAppBar(
            // height: 50,
            style: TabStyle.custom,
            color: Colors.white70,
            backgroundColor: AppColors.backGroundColor1,
            // gradient: LinearGradient(colors: [Colors.grey, Colors.teal]),
            // curveSize: 10,
            // height: 70,
            activeColor: AppColors.mainColor,

            items: [
              TabItem(
                // title: 'Explor',
                // activeIcon: Icon(
                //   Icons.search,
                //   size: Dimensions.iconSize30 * 1.2,
                // ),
                icon: Icons.search,
              ),
              TabItem(
                  // activeIcon: Icon(
                  //   Icons.history,
                  //   size: Dimensions.iconSize30 * 1.2,
                  // ),
                  // title: 'Booking',
                  icon: Icons.history),
              TabItem(
                  // title: 'Profile',
                  // activeIcon: Icon(
                  //   Icons.person_outline,
                  //   size: Dimensions.iconSize30 * 1.2,
                  // ),
                  icon: Icons.person_outline),
            ],
            initialActiveIndex: 0,
            onTap: (index) {
              cubit.changeNavBar(index);
              if (index == 0) {
                cubit.getAllHotels(1);
              }
              if (index == 1) {
                cubit.getCompletedBook("completed", 10);
                cubit.getUpComingBook("upcomming", 10);
                cubit.getCanceledBook("cancelled ", 10);
              }
              if(index==2){
                cubit.getInfo();
              }
            },
          ),
        );
      },
    );
  }
}
