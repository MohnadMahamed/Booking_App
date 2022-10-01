import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/expanded_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/booking_screen.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/widgets/background_details_page.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/widgets/details_map_widget.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/widgets/hotel_details.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/widgets/photohotel.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/widgets/ratinghotel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class DetailsScreen extends StatefulWidget {
  static const routeName = 'DetailsScreen';
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late ScrollController scrollController;
  bool showTitle = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
     // print(scrollController.position.pixels);
      if (scrollController.position.pixels >= Dimensions.detailsTogleHeight) {
        setState(() {
          showTitle = true;
        });
      } else {
        setState(() {
          showTitle = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);

    return BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
                //backgroundColor: AppColors.backGroundColor,
                body: state is GetHotelDetailsSuccessState ||state is CreateBookingSuccessState
                    ? CustomScrollView(controller: scrollController, slivers: [
                        SliverAppBar(
                          elevation: 0,
                          actionsIconTheme: const IconThemeData(size: 25),
                          backgroundColor: Colors.transparent,
                          expandedHeight: MediaQuery.of(context).size.height,
                          pinned: true,
                          toolbarHeight: Dimensions.detailsToolBarHeight,
                          leadingWidth: Dimensions.leadingDetaialsWidth,
                          automaticallyImplyLeading: false,
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 55),
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  // color: Colors.white60
                              ),
                              child: IconButton(
                                  onPressed: () {
                                     cubit.getAllHotels(1);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 30,
                                  )),
                            ),
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 53),
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.transparent
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border,

                                      color: Colors.teal,
                                      size: 30,
                                    )),
                              ),
                            )
                          ],
                          //flexibleSpace
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            background: showTitle == false
                                ? const BackGroundDetailsPage()
                                : const SizedBox(
                                    height: 0,
                                  ),
                            title: showTitle == true
                                ? Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    )),
                                    child: Image(
                                      image: NetworkImage(
                                           "http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                                          //"http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![math.Random().nextInt(cubit.hotelDetails!.hotelImages!.length)].image!}"),

                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const HotelViewDetails(),
                                      myDivider(),
                                      SmallHeadLineText(
                                        text: LocaleKeys.summary.tr(),
                                        size: Dimensions.font20,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10 / 2,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: Dimensions.width20,
                                                right: Dimensions.width20),
                                            child: ExpandableTextWidget(
                                                text: cubit.hotelDetails!
                                                    .description!),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      const RatingHotel(),
                                      SizedBox(
                                        height: Dimensions.height15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallHeadLineText(
                                            text: LocaleKeys.photo.tr(),
                                            size: Dimensions.font20,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                child: SmallText(
                                                  text:
                                                      LocaleKeys.view_all.tr(),
                                                  color: AppColors.mainColor,
                                                ),
                                                onTap: () {},
                                              ),
                                              SizedBox(
                                                width: Dimensions.height10,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                color: Colors.teal,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.height15),
                                      const PhotoOfHotel(),
                                      SizedBox(height: Dimensions.height20),
                                      myDivider(),
                                      SizedBox(height: Dimensions.height10),
                                      const SizedBox(height: 10),

                                      // SizedBox(
                                      //   width: double.infinity,
                                      //   height: 280,
                                      //   child: Image(
                                      //     image: NetworkImage(
                                      //          "http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                                      //         //"http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![math.Random().nextInt(cubit.hotelDetails!.hotelImages!.length)].image!}"),
                                      //
                                      //     height: double.infinity,
                                      //     width: double.infinity,
                                      //     fit: BoxFit.cover,
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                    ],
                                  ),
                                ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: DetailMapWidget(),
                                 ),
                                SizedBox(
                                  height: Dimensions.height30,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width10),
                                  child:
                                  MyButtonWidget(
                                    onTap: () {
                                      cubit.createBookings(cubit.hotelDetails!.id!, cubit.userId);
                                      // cubit.getAllBookings("upcomming", 10);
                                      // Navigator.pushNamed(context, BookingScreen.routeName );

                                    },
                                    text: LocaleKeys.booking_new.tr(),
                                  ),

                                )
                              ],
                            ),
                          ),
                        ),
                      ])
                    : const Center(
                        child: CircularProgressIndicator(),
                      )),
          );
        });
  }
}
