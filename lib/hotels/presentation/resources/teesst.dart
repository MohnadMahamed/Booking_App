import 'package:booking_app/hotels/presentation/resources/String_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Teesst extends StatelessWidget {
  const Teesst({super.key});

  @override
  Widget build(BuildContext context) {
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
                ElevatedButton(
                  onPressed: () async {
                    await context.setLocale(const Locale('en'));
                  },
                  child: const Text(
                    "English",
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await context.setLocale(const Locale('ar'));
                  },
                  child: const Text(
                    "العربية",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
