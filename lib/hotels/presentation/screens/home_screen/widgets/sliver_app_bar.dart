import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';

import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';

import 'package:booking_app/hotels/presentation/screens/home_screen/widgets/sliver_background.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_result_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

var searchAppBarController = TextEditingController();

class SliverApp extends StatelessWidget {
  const SliverApp({
    Key? key,

    required this.images,
  }) : super(key: key);

  final List<Widget> images;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      // backgroundColor: Colors.transparent,
      expandedHeight: Dimensions.homeExpandedHeight,
      pinned: true,
      toolbarHeight: Dimensions.homeToolBarHeight,
      title: Padding(
        padding: EdgeInsets.only(top: Dimensions.height30),
        child: searchButton(
          color: HotelCubit.get(context).isDark
              ? Colors.grey[400]
              : Colors.black87,
          onTap: () {
            Navigator.pushReplacementNamed(context, SearchResultScreen.routeName);
          },
          text: LocaleKeys.search_place.tr(),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
          background: SliverBackgroundWidget(
        images: images,
      )),
    );
  }
}
