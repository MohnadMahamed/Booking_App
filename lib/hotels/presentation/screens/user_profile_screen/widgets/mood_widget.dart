import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolling_switch/rolling_switch.dart';

class MoodWidget extends StatelessWidget {
  const MoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SmallText(
          text: 'Mood',size: 18,
        ),
        RollingSwitch.icon(
          onChanged: (bool state) {
            print('turned ${(state) ? 'on' : 'off'}');
          },
          rollingInfoRight: RollingIconInfo(
            icon: Icons.nightlight,
            iconColor: Colors.black,
            backgroundColor: Colors.grey,
            text: Text(
              'Dark ',
              style: GoogleFonts.kanit(
                color: Colors.black,
                fontSize: Dimensions.font20,
              ),
            ),
          ),
          rollingInfoLeft: RollingIconInfo(
            icon: Icons.light_mode,
            iconColor: Colors.amber,
            backgroundColor: Colors.black,
            text: Text(
              'Light',
              style: GoogleFonts.kanit(
                color: Colors.white,
                fontSize: Dimensions.font20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
