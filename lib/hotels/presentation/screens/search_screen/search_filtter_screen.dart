import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/resources/String_manager.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_result_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/count_and_page.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/distance_slider.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/name_adrees_lat_long.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/popular_facilities.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/price_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFiltterScreen extends StatefulWidget {
  static const routeName = "SearchFiltterScreen";

  const SearchFiltterScreen({super.key});

  @override
  State<SearchFiltterScreen> createState() => _SearchFiltterScreenState();
}

class _SearchFiltterScreenState extends State<SearchFiltterScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.backGroundColor,
        body: BlocConsumer<HotelCubit, HotelState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height20,
                ),
                Container(
                  width: Dimensions.width30 * 2,
                  height: Dimensions.height30 * 2,
                  decoration: BoxDecoration(
                      // color: Colors.transparent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, SearchResultScreen.routeName);
                      },
                      icon: Icon(
                        Icons.close,
                        size: Dimensions.iconSize30 * 1.5,
                        color: AppColors.mainColor,
                      )),
                ),

                // My Button Widget

                SizedBox(
                  height: Dimensions.height10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: BigText(text: LocaleKeys.filtter.tr()),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            SmallHeadLineText(text: LocaleKeys.price_room.tr()),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            //Price Slider
                            const PriceSliderWidget(),
                            //Divider
                            myDivider(),
                            //Popular facilities
                            SmallHeadLineText(
                                text: LocaleKeys.popular_facilities.tr()),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            const PopularFacilitiesWidget(),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            myDivider(),
                            //name address lat and lon
                            const NameAdressLatAndLonWidget(),
                            myDivider(),
                            //Distance Slider
                            SmallHeadLineText(
                                text: LocaleKeys.distance_from_your_location
                                    .tr()),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            const DistanceSliderWidget(),
                            //Divider
                            myDivider(),
                            //count and page
                            const CountAndPageWiget(),
                            const SizedBox(
                              height: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                // My Button Widget
                MyButtonWidget(
                  onTap: () {
                    // Navigator.pushReplacementNamed(
                    //     context, SearchResultScreen.routeName);
                    cubit.filterHotels();
                    Navigator.pop(context);
                  },
                  text: LocaleKeys.apply.tr(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
