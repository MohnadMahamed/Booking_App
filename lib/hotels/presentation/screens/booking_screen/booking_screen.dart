import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/String_manager.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/cancelled_screen.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/completed_screen.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/upcoming_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(


            body: Column(
              children: [
                Expanded(
                  child: DefaultTabController(
                      length: 3,
                      child: Scaffold(
                        appBar: AppBar(
                          centerTitle: true,
                          elevation: 0,
                         // backgroundColor: AppColors.backGroundColor,
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
                                unselectedLabelColor:
                                Colors.white70,
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
                                 // color: AppColors.backGroundColor1,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: const EdgeInsets.only(
                                    top: 40.0, right: 10.0, left: 10.0),
                                tabs:  [
                                  Tab(
                                    child: Center(
                                      child: Text(
                            LocaleKeys.upcoming.tr(),
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Center(
                                      child: Text(
        LocaleKeys.cancelled.tr(),
                                        style: Theme.of(context).textTheme.bodyText1,


                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Center(
                                      child: Text(
        LocaleKeys.completed.tr(),
                                        style: Theme.of(context).textTheme.bodyText1,


                                      ),
                                    ),
                                  ),
                                ],
                                labelPadding: EdgeInsets.zero,
                              ),
                              myDivider()
                            ],
                          ),
                        ),
                        body:  TabBarView(
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
    );
  }
}
