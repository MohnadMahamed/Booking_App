import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200.0, width: 200.0, child: emptySvg),
                const SizedBox(
                  height: 20.0,
                ),
                const SmallText(
                  text: 'No booking to show',
                )
              ],
            ),
          ),
        ));
  }
}
