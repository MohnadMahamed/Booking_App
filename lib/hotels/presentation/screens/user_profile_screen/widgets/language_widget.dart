import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolling_switch/rolling_switch.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SmallText(
          text: 'Language',
        ),
        RollingSwitch.icon(
          onChanged: (bool state) {
            print('turned ${(state) ? 'on' : 'off'}');
          },
          rollingInfoRight: RollingIconInfo(
            icon: Icons.language,
            iconColor: Colors.teal,
            backgroundColor: Colors.grey,
            text: Text(
              'عربي',
              style: GoogleFonts.kanit(
                color: Colors.black,
                fontSize: Dimensions.font26,
              ),
            ),
          ),
          rollingInfoLeft: RollingIconInfo(
            icon: Icons.language,
            iconColor: Colors.teal,
            backgroundColor: Colors.teal,
            text: Text(
              'English',
              style: GoogleFonts.kanit(
                color: Colors.white70,
                fontSize: Dimensions.font20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
