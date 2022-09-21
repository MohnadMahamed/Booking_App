import 'package:flutter/material.dart';

Widget Hotal_Card() => SliverToBoxAdapter(
  child: Container(
    height: 700,
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15,left: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadiusDirectional.all(
                      Radius.circular(17)),
                  color: Colors.white.withOpacity(0.1),
                ),
                height: 140,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                              const BorderRadiusDirectional.only(
                                topStart: Radius.circular(17),
                                bottomStart: Radius.circular(17),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadiusDirectional.only(
                                topStart: Radius.circular(17),
                                bottomStart: Radius.circular(17),
                              ),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/wallpapersden.com_programming-coding-language_wxl.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ))),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Queen Hotal',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                'Wembly,London',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.teal,
                                    size: 16,
                                  ),
                                  Text(
                                    '4.0 Km to city',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.teal,
                                    size: 16,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.teal,
                                    size: 16,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.teal,
                                    size: 16,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.teal,
                                    size: 16,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 6,bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "\$200",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '/per night',
                            style:
                            TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);