import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../../../controller/hotel_cubit.dart';

class MoodWidget extends StatelessWidget {
  const MoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallHeadLineText(
          text: LocaleKeys.mood.tr(),
        ),
        RollingSwitch.icon(
          onChanged: (bool state) {
            HotelCubit.get(context).changeAppMode();
          },
          rollingInfoRight: RollingIconInfo(
            icon: Icons.nightlight,
            iconColor: Colors.black,
            backgroundColor: Colors.grey,
            text: Text(
              LocaleKeys.dark.tr(),
              style: GoogleFonts.kanit(
                color: Colors.black87,
                fontSize: Dimensions.font12,
              ),
            ),
          ),
          rollingInfoLeft: RollingIconInfo(
            icon: Icons.light_mode,
            iconColor: Colors.amber,
            backgroundColor: Colors.black,
            text: Text(
              LocaleKeys.light.tr(),
              style: GoogleFonts.kanit(
                color: Colors.white70,
                fontSize: Dimensions.font12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
