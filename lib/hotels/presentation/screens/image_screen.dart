import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';

class SelectImage extends StatefulWidget {
  static const routeName = 'SelectImage';

  const SelectImage({Key? key}) : super(key: key);

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          // child:  (HotelCubit.get(context).image==null)?Center(child: const Text("no image Selceted")):
        // Image.asset(HotelCubit.get(context).image!.path),
        ),
Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
            Expanded(child: ElevatedButton(
              child: Text("from gallery"),
              onPressed: () {
                HotelCubit.get(context).getImageFromGallery();
              },),),
            SizedBox(width: 20,),
            Expanded(child: ElevatedButton(child: Text("from camera"),onPressed: (){
              HotelCubit.get(context).getImageFromCamera();
            },),),
          ],),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("ok")),
        )
      ],
    ));
  }
}
