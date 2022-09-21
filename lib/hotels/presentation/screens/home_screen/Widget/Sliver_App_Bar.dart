import 'package:booking_app/hotels/presentation/screens/home_screen/Widget/Custom_Button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sliver_App_Bar extends StatelessWidget {
  const Sliver_App_Bar({
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
      floating: false,
      pinned: true,
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.icecream))],
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
                ))
          ],
        ),
      ),
      //title: Text('My App Bar'),
    );
  }
}
