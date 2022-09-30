import 'package:flutter/material.dart';

class ReviewsOfHotel extends StatefulWidget {
  const ReviewsOfHotel({Key? key}) : super(key: key);

  @override
  State<ReviewsOfHotel> createState() => _ReviewsOfHotelState();
}

class _ReviewsOfHotelState extends State<ReviewsOfHotel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width:60 ,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Image.asset(
                      'assets/images/1.jpg',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    // child: Image(
                    //   image: NetworkImage("http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                    //   height: double.infinity,
                    //   width: double.infinity,
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  const SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alexia jane',
                        style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60

                        ),
                      ),
                      Text(
                        ' Last Update 21 May,2019',
                        style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white38

                        ),
                      ),
                      Text(
                        '(8.0)',
                        style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60

                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Text(
                ' This is located in a great spot close to shops and bars, very quiet location',
                style:const TextStyle(
                    wordSpacing: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60

                ),
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: const Text(
                          'Reply',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward,color: Colors.teal,)

                    ],),


                ],),
              const SizedBox(height: 10,)
            ],
          ),
          separatorBuilder:(context, index) => Column(
            children: [
              Container(
                height: 1,
                color: Colors.grey.shade700,
              ),
              const SizedBox(height: 15,)
            ],
          ),
          itemCount: 3
      ),
    );
  }
}
