import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class SliverBackgroundWidget extends StatefulWidget {
  final List<Widget> images;

  const SliverBackgroundWidget({super.key, required this.images});

  @override
  State<SliverBackgroundWidget> createState() => _SliverBackgroundWidgetState();
}

class _SliverBackgroundWidgetState extends State<SliverBackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            //Carousel Slider
            CarouselSlider(
                items: widget.images,
                options: CarouselOptions(
                  height: Dimensions.carouselrHeight,
                  aspectRatio: 5 / 7,
                  viewportFraction: 1,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      cubit.pageNumber = index;
                    });
                  },
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
                left: Dimensions.width20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //my button
                    MyButtonWidget(
                      onTap: () {
                        HotelCubit.get(context).getDetails(1);
                        Navigator.pushNamed(context, DetailsScreen.routeName);
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
      },
    );
  }
  // String hoteName(index,reason){
  //   return HotelCubit.get(context).
  // }
}
