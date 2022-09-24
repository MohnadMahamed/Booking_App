import 'package:booking_app/hotels/presentation/screens/home_screen/Widget/Hotal_Card.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/Widget/Sliver_App_Bar.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/Widget/Sliver_To_Box_Adapter.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({super.key});

  var SearchController;
  static const routeName = 'HomeScreen';

  // final List<Widget> images = [
  //   const Image(
  //     image: AssetImage('assets/images/21.PNG'),
  //     fit: BoxFit.cover,
  //   ),
  //   const Image(
  //     image: AssetImage('assets/images/22.PNG'),
  //     fit: BoxFit.cover,
  //   ),
  //   const Image(
  //     image: AssetImage(
  //         'assets/images/wallpapersden.com_programming-coding-language_wxl.jpg'),
  //     fit: BoxFit.cover,
  //   ),
  // ];


//


  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // if(State is UserLoginSuccessState){
        //   cubit.getAllHotels(3);
        // }
      },
      builder: (context, state) {
        if(state is GetAllHotelsSuccessState){
          return Scaffold(
            backgroundColor: Colors.grey[900],
            body: CustomScrollView(
physics: ScrollPhysics(),
              slivers: [
                SliverApp(images: buildListView(), SearchController: SearchController,),
                const SliverAdapter(),

                hotelCard(),
                //
              ],
            ),
            // body: buildListView(),
          );

        }else
        return Scaffold( body:Center(child: CircularProgressIndicator(),),);

      },
    );
  }

  List<Widget> buildListView() {
    return [BlocConsumer<HotelCubit, HotelState>(

      listener: (context, state) {

      },

      builder: (context, state) {
      var cubit=HotelCubit.get(context);
        return ListView.builder(

          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if(cubit.allHotelsData!.hotelData![index].hotelImages![0].image!.isEmpty){
              return Image(
                image: AssetImage("assets/images/no.png"),
                fit: BoxFit.cover,
              );

            }else{
            return Image(
              image: NetworkImage("http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![0].image!}"),
              fit: BoxFit.cover,
            );}
          },
          itemCount: 1,

        );
      },
    )
    ];
  }
}
