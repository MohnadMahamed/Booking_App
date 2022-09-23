import 'package:flutter/material.dart';

class PhotoOfHotel extends StatefulWidget {
  const PhotoOfHotel({Key? key}) : super(key: key);

  @override
  State<PhotoOfHotel> createState() => _PhotoOfHotelState();
}

class _PhotoOfHotelState extends State<PhotoOfHotel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width:100 ,
            height: 100,
            decoration: BoxDecoration(
              //color: Colors.red,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Image.asset(
              'assets/images/1.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          separatorBuilder:(context, index) => const SizedBox(width: 20,),
          itemCount: 5
      ),
    );
  }
}
