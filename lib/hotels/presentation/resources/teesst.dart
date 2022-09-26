import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/String_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Teesst extends StatelessWidget {
  const Teesst({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<HotelCubit,HotelState>(
        listener: (context,state){},
    builder: (context,state) {
          return Scaffold(
          body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text(
          LocaleKeys.your_email.tr(),
      ),
      Text(
      LocaleKeys.address.tr(),
      ),
      const SizedBox(height: 15),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
    StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
    return
      ElevatedButton(
      onPressed: () async {
print('en');
      await  context.setLocale(const Locale('en'));
      setState((){});


      },
      child: const Text(
      "English",

                  ),
                );}),
    StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
    return
      ElevatedButton(
      onPressed: () async {
        print('ar');
      await  context.setLocale(const Locale('ar'));
      setState((){});


      },
      child: const Text(
      "العربيه",

                  ),
                )
    ;}),

              ],
            ),
          ],
        ),
      ),
    );
  });}}
