import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:flutter/material.dart';

class DistanceSliderWidget extends StatefulWidget {
  const DistanceSliderWidget({super.key});

  @override
  State<DistanceSliderWidget> createState() => _DistanceSliderWidgetState();
}

class _DistanceSliderWidgetState extends State<DistanceSliderWidget> {
  double distaceSliderValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      label: '${distaceSliderValue.toInt()} Km',
      divisions: 20,
      min: 0,
      max: 100,
      value: distaceSliderValue,
      onChanged: (value) {
        setState(() {
          distaceSliderValue = value;
        });
      },
      activeColor: AppColors.mainColor,
      inactiveColor: Colors.grey,
    );
  }
}
