import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../screens/component/my_buttom.dart';

class BackGroundDetailsPage extends StatefulWidget {
  const BackGroundDetailsPage({Key? key}) : super(key: key);

  @override
  State<BackGroundDetailsPage> createState() => _BackGroundDetailsPageState();
}

class _BackGroundDetailsPageState extends State<BackGroundDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
              borderRadius:  BorderRadius.only(
                bottomLeft:  Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),)
          ),
          child: Image.asset(
            'assets/images/1.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding:const EdgeInsets.only(top: 440),
          child: Container(
            height: 200,
            width: double.infinity,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Card(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 2, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Grand Royal Hotel',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Wembley, Londen',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.normal,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.add_location,
                                  color: Colors.teal,
                                  size: 20,
                                ),
                                Text(
                                  '2.0km to city',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "\$ 180",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "/per night",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.teal,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.teal,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.teal,
                            ),
                            Icon(
                              Icons.star_half,
                              color: Colors.teal,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '80Reviews',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        MyButton(
                          text: 'Book now',
                          onClick: () {},
                          height: 45,
                          sizeText: 16,
                          background: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 580),
            child: Container(
              height: 51,
              width: 130,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child:
                  Card(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 2, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'More Details',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        const Icon(Icons.keyboard_arrow_down,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
