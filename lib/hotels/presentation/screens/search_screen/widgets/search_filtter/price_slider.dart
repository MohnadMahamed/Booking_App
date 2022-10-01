import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';

class PriceSliderWidget extends StatefulWidget {
  const PriceSliderWidget({super.key});

  @override
  State<PriceSliderWidget> createState() => _PriceSliderStateWidget();
}

class _PriceSliderStateWidget extends State<PriceSliderWidget> {

  @override
  Widget build(BuildContext context) {
    var cubit=HotelCubit.get(context);
    return RangeSlider(
      labels: RangeLabels('\$${cubit.priceSliderStartValue.toInt()}',
          '\$${cubit.priceSliderEndValue.toInt()}'),
      divisions: 100,
      min: 10,
      max:500,
      values: RangeValues( cubit.priceSliderStartValue, cubit.priceSliderEndValue),
      onChanged: (values) {
        setState(() {
          cubit.priceSliderStartValue = values.start;
          cubit.priceSliderEndValue = values.end;
        });
      },
      activeColor: AppColors.mainColor,
      inactiveColor: Colors.grey,
    );
  }
}
