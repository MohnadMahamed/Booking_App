import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height10, vertical: Dimensions.width20),
      child: Container(
        // margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        height: Dimensions.height30 * 2,
        width: double.infinity,
        child: const Center(
          child: BigText(
            text: 'Apply',
            color: Colors.white,
          ),
        ),
      ),
    );
    ;
  }
}
