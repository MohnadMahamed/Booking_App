import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_widget.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = 'DetailsScreen';
  const DetailsScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit,HotelState>(
       listener: (context, state) {

       },
       builder: (context, state) {
         if(state is GetHotelDetailsSuccessState){
           return   DetailsWidget();

         }else
           {
             return Center(child: CircularProgressIndicator(),);

           }

    }) ;
  }
}
