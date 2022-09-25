import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_result_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/count_and_page.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/distance_slider.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/name_adrees_lat_long.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/popular_facilities.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/widgets/search_filtter/price_slider.dart';
import 'package:flutter/material.dart';

class SearchFiltterScreen extends StatefulWidget {
  static const routeName = 'SearchFiltterScreen';

  const SearchFiltterScreen({super.key});

  @override
  State<SearchFiltterScreen> createState() => _SearchFiltterScreenState();
}

class _SearchFiltterScreenState extends State<SearchFiltterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.height20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                width: Dimensions.width30 * 2,
                height: Dimensions.height30 * 2,
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.3),
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
            ),

            SizedBox(
              height: Dimensions.height20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: BigText(text: 'Filtter'),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        const SmallText(text: 'price (for 1 night)'),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        //Money Slider
                        const PriceSliderWidget(),
                        //Divider
                        myDivider(),
                        //Popular facilities
                        const SmallText(text: 'Popular facilities'),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        const PopularFacilitiesWidget(),
                        myDivider(),
                        //name address lat and lon
                        const NameAdressLatAndLonWidget(),
                        myDivider(),
                        const SmallText(text: 'Distance From your location'),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        //Distance Slider
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
                Navigator.pushReplacementNamed(
                    context, SearchResultScreen.routeName);
              },
              text: 'Apply',
            ),
          ],
        ),
      ),
    );
  }
}
