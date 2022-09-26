import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:flutter/material.dart';

class PriceSliderWidget extends StatefulWidget {
  const PriceSliderWidget({super.key});

  @override
  State<PriceSliderWidget> createState() => _PriceSliderStateWidget();
}

class _PriceSliderStateWidget extends State<PriceSliderWidget> {
  double priceSliderStartValue = 20.0;
  double priceSliderEndValue = 90.0;
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      labels: RangeLabels('\$${priceSliderStartValue.toInt()}',
          '\$${priceSliderEndValue.toInt()}'),
      divisions: 20,
      min: 0,
      max: 100,
      values: RangeValues(priceSliderStartValue, priceSliderEndValue),
      onChanged: (values) {
        setState(() {
          priceSliderStartValue = values.start;
          priceSliderEndValue = values.end;
        });
      },
      activeColor: AppColors.mainColor,
      inactiveColor: Colors.grey,
    );
  }
}
