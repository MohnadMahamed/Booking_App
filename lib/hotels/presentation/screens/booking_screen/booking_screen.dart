import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/layout/test1.dart';
import 'package:booking_app/hotels/presentation/layout/test2.dart';
import 'package:booking_app/hotels/presentation/layout/test3.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: Column(
            children: [
              myDivider(),
              const SizedBox(
                height: 10,
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
                          Test1(),
                          Test2(),
                          Test3(),
                        ],
                      ),
                    )),
              )
            ],
          )),
    );
  }
}
