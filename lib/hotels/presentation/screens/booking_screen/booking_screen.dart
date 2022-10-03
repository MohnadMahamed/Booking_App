import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/cancelled_screen.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/completed_screen.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/upcoming_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:to_do_app/modules/all_task_screen.dart';
// import 'package:to_do_app/modules/completed_screen.dart';
// import 'package:to_do_app/modules/favorite_screen.dart';
// import 'package:to_do_app/modules/schedule_screen.dart';
// import 'package:to_do_app/modules/un_completed_screen.dart';
// import 'package:to_do_app/shared/components/component.dart';

class BookingScreen extends StatelessWidget {
  static const routeName = "BookingScreen";
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      // leading: IconButton(
                      //   onPressed: (){
                      //     cubit.getAllHotels(1);
                      //     Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
                      //   }
                      //   ,icon: Icon(Icons.arrow_back_ios_rounded),
                      // ),
                      // centerTitle: true,
                      elevation: 0,
                      toolbarHeight: 80,
                      // backgroundColor: AppColors.backGroundColor,
                      title: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TabBar(
                              onTap: (int index) {
                                if (index == 0) {
                                  cubit.getUpComingBook("upcomming", 10);
                                }
                                if (index == 1) {
                                  cubit.getCanceledBook("cancelled", 10);
                                }
                                if (index == 2) {
                                  cubit.getCompletedBook("completed", 10);
                                }
                              },
                              unselectedLabelColor: Colors.white70,
                              unselectedLabelStyle: GoogleFonts.kanit(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold,
                              ),
                              labelColor: Colors.white,
                              labelStyle: GoogleFonts.kanit(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              indicator: BoxDecoration(
                                color: AppColors.mainColor,
                                // color: AppColors.backGroundColor1,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              padding: const EdgeInsets.only(
                                top: 40,
                                right: 0,
                                left: 10,
                              ),
                              tabs: [
                                Tab(
                                  height: 60,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        LocaleKeys.upcoming.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  height: 60,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        LocaleKeys.cancelled.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  height: 60,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        LocaleKeys.completed.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              labelPadding: EdgeInsets.zero,
                            ),
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
    );
  }
}
