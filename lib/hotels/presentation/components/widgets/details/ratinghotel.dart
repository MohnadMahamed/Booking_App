import 'package:flutter/material.dart';

class RatingHotel extends StatefulWidget {
  const RatingHotel({Key? key}) : super(key: key);

  @override
  State<RatingHotel> createState() => _RatingHotelState();
}

class _RatingHotelState extends State<RatingHotel> {
  double height = 120;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 220,
      child: Card(
        color: Color(0XFF2C2C2C),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1, color: Colors.transparent
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '8.8',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  SizedBox(width: 10,),
                  const Text(
                    'Overall rating',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white60),
                  ),
                ],
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Room',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white60),
                  ),
                  SizedBox(width: 28,),
                  Slider(activeColor: Colors.teal,
                    autofocus: true,
                    value: height,
                    min: 0,max: 150,
                    onChanged: (value ){
                      setState(() {
                      });
                    },)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Services',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white60),
                  ),
                  SizedBox(width: 8,),
                  Slider(activeColor: Colors.teal,
                    autofocus: true,
                    value: height,
                    min: 20,max: 180,
                    onChanged: (value ){
                      setState(() {
                      });
                    },)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white60),
                  ),
                  SizedBox(width: 30,),
                  Slider(activeColor: Colors.teal,
                    autofocus: true,
                    value: height,
                    min: 0,max: 160,
                    onChanged: (value ){
                      setState(() {
                      });
                    },)
                ],
              ),

            ],
          ),
        ),
      ),
    );
    ;
  }
}
