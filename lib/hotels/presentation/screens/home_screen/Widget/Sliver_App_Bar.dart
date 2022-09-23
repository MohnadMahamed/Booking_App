import 'package:booking_app/hotels/presentation/screens/home_screen/Widget/Custom_Button.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/Widget/Text_Form_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sliver_App_Bar extends StatelessWidget {
  const Sliver_App_Bar({
    Key? key,
    required this.images,
    required this.SearchController,
  }) : super(key: key);

  final List<Widget> images;
  final SearchController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      expandedHeight: 380,
      floating: false,
      pinned: true,
      title: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: const BoxDecoration(
            color: const Color(0xff2C2C2C),
            borderRadius:
            BorderRadiusDirectional.all(Radius.circular(50)),
          ),
          child: defaultFormField(
            controller: SearchController,
            label: 'Where are you going ?',
            color: Colors.grey,
            border:50,
            prefix: Icons.search,
            Icon_color: Colors.teal,
            type: TextInputType.text,
            border_chang_color: const Color(0xff2C2C2C),
            border_color: const Color(0xff2C2C2C),
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'Enter Where are you going ?';
              }
              return null;
            },
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            CarouselSlider(
                items: images,
                options: CarouselOptions(
                  height: 450,
                  aspectRatio: 5 / 7,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )),
            Positioned(
                bottom: 50,
                left: 30,
                child: Column(
                  children: [
                    Text(
                      'Cape Town',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'five-star ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'View Hotel',
                      fontSize: 16,
                    ),
                  ],
                )),

          ],
        ),
      ),
      //title: Text('My App Bar'),
    );
  }
}
