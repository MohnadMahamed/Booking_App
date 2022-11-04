import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/cancelled_screen.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/completed_screen.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/upcoming_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
            body: Container(
          color: Colors.amber,
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
                  toolbarHeight: 90,
                  // backgroundColor: Colors.grey[800],
                  title: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
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
                            isScrollable: true,
                            unselectedLabelColor: Colors.black87,
                            unselectedLabelStyle: GoogleFonts.kanit(
                              fontSize: Dimensions.font16 + 2,
                              fontWeight: FontWeight.bold,
                            ),
                            labelColor: Colors.white70,
                            labelStyle: GoogleFonts.kanit(
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,
                            ),
                            indicator: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            tabs: [
                              Tab(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      LocaleKeys.upcoming.tr(),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      LocaleKeys.cancelled.tr(),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      LocaleKeys.completed.tr(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            labelPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
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
        ));
      },
    );
  }
}
