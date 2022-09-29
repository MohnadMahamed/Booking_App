import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SliverBackgroundWidget extends StatelessWidget {
  final List<Widget> images;

  const SliverBackgroundWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Carousel Slider
        CarouselSlider(
            items: images,
            options: CarouselOptions(
              height: Dimensions.carouselrHeight,
              aspectRatio: 5 / 7,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )),
        //info details
        Positioned(
            bottom: Dimensions.height30,
            left: Dimensions.width30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallHeadLineText(
                  text: 'Cape Town',
                  size: Dimensions.font20,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                const SmallText(
                  text: 'Extrandianary five-star hotel',
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                //my button
                MyButtonWidget(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, DetailsScreen.routeName);
                  },
                  text: LocaleKeys.view_hotel.tr(),
                  isPadding: false,
                  width: Dimensions.width30 * 6,
                  height: Dimensions.width30 * 2,
                ),
              ],
            )),
      ],
    );
  }
}
