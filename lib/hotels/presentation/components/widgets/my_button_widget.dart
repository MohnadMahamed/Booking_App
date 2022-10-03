import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final bool? isPadding;
  const MyButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.width = 0,
      this.height = 0,
      this.isPadding = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPadding!
          ? EdgeInsets.symmetric(
              horizontal: Dimensions.height10, vertical: Dimensions.width20)
          : const EdgeInsets.all(0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(Dimensions.radius30),
          ),
          // height: ,
          width: width == 0 ? double.infinity : width,
          height: height == 0 ? Dimensions.height30 * 1.7 : height,
          child: Center(
            child: StaticColorText(
              text: text,
              size: Dimensions.width20,
              // color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
