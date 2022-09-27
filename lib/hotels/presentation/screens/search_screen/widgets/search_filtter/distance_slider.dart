import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistanceSliderWidget extends StatefulWidget {
  const DistanceSliderWidget({super.key});

  @override
  State<DistanceSliderWidget> createState() => _DistanceSliderWidgetState();
}

class _DistanceSliderWidgetState extends State<DistanceSliderWidget> {

  @override
  Widget build(BuildContext context) {
    var cubit=HotelCubit.get(context);
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        return Slider(
          label: '${cubit.distaceSliderValue.toInt()} Km',
          divisions: 20,
          min: 0,
          max: 100,
          value: cubit.distaceSliderValue,
          onChanged: (value) {
            setState(() {
              cubit.distaceSliderValue = value;
            });
          },
          activeColor: AppColors.mainColor,
          inactiveColor: Colors.grey,
        );
      },
    );
  }
}
