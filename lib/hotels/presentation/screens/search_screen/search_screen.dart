import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/search/count_and_page.dart';
import 'package:booking_app/hotels/presentation/components/widgets/search/distance_slider.dart';
import 'package:booking_app/hotels/presentation/components/widgets/search/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/search/price_slider.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/search/name_adrees_lat_long.dart';
import 'package:booking_app/hotels/presentation/components/widgets/search/popular_facilities.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 1, 2, 19).withOpacity(0.8),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.height20,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close_rounded,
                  size: Dimensions.iconSize30,
                  color: Colors.white,
                )),
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
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        //Divider
                        myDivider(),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        //Popular facilities
                        const SmallText(text: 'Popular facilities'),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        const PopularFacilitiesWidget(),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        myDivider(),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        //name address lat and lon
                        const NameAdressLatAndLonWidget(),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        myDivider(),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        const SmallText(text: 'Distance From your location'),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        //Distance Slider
                        const DistanceSliderWidget(),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        //Divider
                        myDivider(),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
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
            const MyButtonWidget(),
          ],
        ),
      ),
    );
  }
}
