import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/String_manager.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/widgets/background_details_page.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/widgets/hotel_details.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/widgets/photohotel.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/widgets/ratinghotel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
      if (scrollController.position.pixels >= 645) {
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
                body: state is GetHotelDetailsSuccessState
                    ? CustomScrollView(controller: scrollController, slivers: [
                        SliverAppBar(
                          elevation: 0,
                          actionsIconTheme: const IconThemeData(size: 25),
                          backgroundColor: Colors.transparent,
                          expandedHeight: MediaQuery.of(context).size.height,
                          pinned: true,
                          toolbarHeight: 150,
                          leadingWidth: 100,
                          automaticallyImplyLeading: false,
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 55),
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white60),
                              child: IconButton(
                                  onPressed: () {
                                    // cubit.getAllHotels(1);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 20,
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
                                    color: Colors.black87),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.teal,
                                      size: 20,
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
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const HotelViewDetails(),
                                      myDivider(),

                                      MediumText(
                          text: LocaleKeys.summary.tr(),

                                        size: Dimensions.font12 * 2,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10 / 2,
                                      ),
                                      SmallText(
                                        // 'Featuring a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum...',
                                        text: cubit.hotelDetails!.description!,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const RatingHotel(),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [

                                          MediumText(
                                      text: LocaleKeys.photo.tr(),




                                            size: Dimensions.font12 * 2,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                child: SmallText(
                                                  text: LocaleKeys.view_all.tr(),
                                                  size: Dimensions.font12 * 2,
                                                  color: AppColors.mainColor,
                                                ),
                                                onTap: () {},
                                              ),
                                              SizedBox(
                                                width: Dimensions.height10 * 2,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                color: Colors.teal,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      const PhotoOfHotel(),
                                      const SizedBox(height: 20),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     const Text(
                                      //       'Reviews',
                                      //       style: TextStyle(
                                      //           fontSize: 16,
                                      //           color: Colors.white,
                                      //           fontWeight: FontWeight.bold),
                                      //     ),
                                      //     Row(
                                      //       children: [
                                      //         InkWell(
                                      //           child: const Text(
                                      //             'View all',
                                      //             style: TextStyle(
                                      //                 fontSize: 16,
                                      //                 color: Colors.teal,
                                      //                 fontWeight: FontWeight.bold),
                                      //           ),
                                      //           onTap: () {},
                                      //         ),
                                      //         const Icon(
                                      //           Icons.arrow_forward,
                                      //           color: Colors.teal,
                                      //         )
                                      //       ],
                                      //     ),
                                      //   ],
                                      // ),
                                      // ReviewsOfHotel(),
                                      myDivider(),
                                      const SizedBox(height: 10),

                                      SizedBox(
                                        width: double.infinity,
                                        height: 280,
                                        child: Image(
                                          image: NetworkImage(
                                              "http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      MyButtonWidget(
                                        onTap: () {
                                          cubit.createBookings(cubit.hotelDetails!.id!, cubit.userId);
                                        },
                                        text: LocaleKeys.booking_new.tr(),
                                      )
                                    ],
                                  ),
                                ),
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
