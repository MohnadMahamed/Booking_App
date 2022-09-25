import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/widgets/sliver_background.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_result_screen.dart';
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
      backgroundColor: Colors.transparent,
      expandedHeight: 380,
      pinned: true,
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: searchButton(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, SearchResultScreen.routeName);
          },
          text: 'Where are you going ?',
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
          background: SliverBackgroundWidget(
        images: images,
      )),
    );
  }
}
