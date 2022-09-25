import 'dart:developer';

import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';

bool wifiCheckBoxVaule = false;
bool acCheckBoxVaule = false;

class PopularFacilitiesWidget extends StatefulWidget {
  const PopularFacilitiesWidget({super.key});

  @override
  State<PopularFacilitiesWidget> createState() =>
      _PopularFacilitiesStateWidget();
}

class _PopularFacilitiesStateWidget extends State<PopularFacilitiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: wifiCheckBoxVaule,
              activeColor: AppColors.mainColor,
              side: const BorderSide(
                color: Colors.white24,
                width: 2,
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              splashRadius: 20.0,
              onChanged: (value) {
                setState(() {
                  wifiCheckBoxVaule = value!;
                  log(wifiCheckBoxVaule.toString());
                });
              },
            ),
            const SmallText(text: 'Free Wi-Fi'),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: Dimensions.width30 * 3),
          child: Row(
            children: [
              Checkbox(
                value: acCheckBoxVaule,
                activeColor: AppColors.mainColor,
                side: const BorderSide(
                  color: Colors.white24,
                  width: 2,
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                splashRadius: 20.0,
                onChanged: (value) {
                  setState(() {
                    acCheckBoxVaule = value!;
                    log(acCheckBoxVaule.toString());
                  });
                },
              ),
              const SmallText(text: 'A/C'),
            ],
          ),
        ),
      ],
    );
  }
}
