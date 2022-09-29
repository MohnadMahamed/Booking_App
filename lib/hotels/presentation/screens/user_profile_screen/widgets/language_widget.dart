import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolling_switch/rolling_switch.dart';

//LanguageWidget
class LanguageWidget extends StatefulWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(listener: (context, state) {
      // if(state is LangEnStateSuccess)
      // {
      //   context.setLocale( Locale('en'));
      // } else if (state is LangArStateSuccess){
      //   context.setLocale( Locale('ar'));
      // }
    }, builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallHeadLineText(
            text: LocaleKeys.language.tr(),
          ),
          RollingSwitch.icon(
            onChanged: (b) {
              HotelCubit.get(context).changeLang(context);
            },
            rollingInfoRight: RollingIconInfo(
              icon: Icons.language,
              iconColor: Colors.teal,
              backgroundColor: Colors.grey,
              text: Text(
                LocaleKeys.arabic.tr(),
                style: GoogleFonts.kanit(
                  color: Colors.black87,
                  fontSize: Dimensions.font12,
                ),
              ),
            ),
            rollingInfoLeft: RollingIconInfo(
              icon: Icons.language,
              iconColor: Colors.teal,
              backgroundColor: Colors.teal,
              text: Text(
                LocaleKeys.english.tr(),
                style: GoogleFonts.kanit(
                  color: Colors.white70,
                  fontSize: Dimensions.font12,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
