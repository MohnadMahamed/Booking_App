import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/cancelled_screen.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/completed_screen.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/upcoming_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:to_do_app/modules/all_task_screen.dart';
// import 'package:to_do_app/modules/completed_screen.dart';
// import 'package:to_do_app/modules/favorite_screen.dart';
// import 'package:to_do_app/modules/schedule_screen.dart';
// import 'package:to_do_app/modules/un_completed_screen.dart';
// import 'package:to_do_app/shared/components/component.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HotelCubit.get(context);
    return SafeArea(
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColors.backGroundColor,
              body: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  Expanded(
                    child: DefaultTabController(
                        length: 3,

                        child: Scaffold(
                          appBar: AppBar(
                            toolbarHeight: 90,
                            centerTitle: true,
                            backgroundColor: AppColors.backGroundColor,
                            title: Column(
                              children: [
                                TabBar(
                                  onTap: (int index) {
                                    if (index == 0) {
cubit.getAllBookings("upcomming", 10);
                                    }
                                    if (index == 1) {
                                      cubit.getAllBookings("cancelled", 10);

                                    }
                                    if (index == 2) {
                                      cubit.getAllBookings("completed", 10);

                                    }
                                  },
                                  unselectedLabelColor: Colors.white,
                                  unselectedLabelStyle: TextStyle(
                                    fontSize: Dimensions.font20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: Dimensions.font20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  indicator: BoxDecoration(
                                    color: Colors.teal.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  padding: const EdgeInsets.only(
                                      top: 20.0, right: 10.0, left: 10.0),
                                  tabs: const [
                                    Tab(
                                      height: 70.0,
                                      child: Center(
                                        child: Text(
                                          'Upcoming',
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      height: 70.0,
                                      child: Center(
                                        child: Text(
                                          'Cancelled ',
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      height: 70.0,
                                      child: Center(
                                        child: Text(
                                          'Completed',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                myDivider()
                              ],
                            ),
                          ),
                          body: const TabBarView(
                            children: [
                              UpcomingScreen(),
                              CancelledScreen(),
                              CompletedScreen(),
                            ],
                          ),
                        )),
                  )
                ],
              ));
        },
      ),
    );
  }
}
