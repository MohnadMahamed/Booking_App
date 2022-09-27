import 'dart:developer';

import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PopularFacilitiesWidget extends StatefulWidget {
  const PopularFacilitiesWidget({super.key});

  @override
  State<PopularFacilitiesWidget> createState() =>
      _PopularFacilitiesStateWidget();
}

class _PopularFacilitiesStateWidget extends State<PopularFacilitiesWidget> {

  @override
  Widget build(BuildContext context) {
    var cubit=HotelCubit.get(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: cubit.wifiCheckBoxVaule,
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
                      cubit. wifiCheckBoxVaule = value!;
                      log(cubit.wifiCheckBoxVaule.toString());
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
                    value: cubit.acCheckBoxVaule,
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
                        cubit. acCheckBoxVaule = value!;
                        log(cubit.acCheckBoxVaule.toString());
                      });
                    },
                  ),
                  const SmallText(text: 'A/C'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
