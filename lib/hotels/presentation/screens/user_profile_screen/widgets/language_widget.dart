
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/String_manager.dart';
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

    return BlocConsumer<HotelCubit,HotelState>(
        listener: (context,state){
          // if(state is LangEnStateSuccess)
          // {
          //   context.setLocale( Locale('en'));
          // } else if (state is LangArStateSuccess){
          //   context.setLocale( Locale('ar'));
          // }
        },
        builder: (context,state) {
          return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallText(
              text: LocaleKeys.language.tr(),
              size: 18,
            ),
            RollingSwitch.icon(

              onChanged: (b){
                HotelCubit.get(context).changeLang(context);

                // HotelCubit.get(context).lang ? HotelCubit.get(context).langStateEn(lang:lang) : HotelCubit.get(context).langStateAr(lang:lang);
                // print('turned ${(state) ? 'on' : 'off'}');
               // print(lang);
               //
               //  if ( lang ==true) {
               //    await context.setLocale(const Locale('en'));
               //    HotelCubit.get(context).langStateEn();
               //  }
               //  else {
               //    await context.setLocale(const Locale('ar'));
               //    HotelCubit.get(context).langStateAr();
               //
               //  }
               //lang ? context.setLocale( Locale('en')) : context.setLocale( Locale('ar'));
               //HotelCubit.get(context).langStateAr() : HotelCubit.get(context).langStateEn();

                // if (lang == true) {
                //   HotelCubit.get(context).langStateAr();
                //   print(lang);
                // }

                // else {
                //   print(lang);
                //   HotelCubit.get(context).langStateEn(lang: lang);
                // }
                // else {
                //   HotelCubit.get(context).langStateAr();
                //
                // }

              },
              rollingInfoRight: RollingIconInfo(
                icon: Icons.language,
                iconColor: Colors.teal,
                backgroundColor: Colors.grey,
                text: Text(
                  LocaleKeys.arabic.tr(),
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
                  LocaleKeys.english.tr(),
                  style: GoogleFonts.kanit(
                    color: Colors.white70,
                    fontSize: Dimensions.font20,
                  ),
                ),

              ),
            ),
          ],
        );}
    );
  }
}

