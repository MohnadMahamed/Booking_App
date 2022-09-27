import 'package:booking_app/core/services/blocobserver.dart';
import 'package:booking_app/core/services/services_locator.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/resources/codegen_loader.g.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/hotels/presentation/screens/image_screen.dart';
import 'package:booking_app/hotels/presentation/screens/login_screen/login_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_result_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_filtter_screen.dart';
import 'package:booking_app/hotels/presentation/styles/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'hotels/presentation/screens/register_screen/register_screen.dart';

void main() async {
  ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
        path: "assets/translations",
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        // fallbackLocale:   Locale('en'),
        assetLoader:  CodegenLoader(),
        child:  MyApp(),
      ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HotelCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(),sl(),sl()),
      child: BlocConsumer<HotelCubit, HotelState>(
  listener: (context, state) async{

  },
  builder: (context, state) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const RegisterScreen(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales:context.supportedLocales,
        locale: context.locale,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: HotelCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,

        routes: {
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          DetailsScreen.routeName: (context) => const DetailsScreen(),
          SearchFiltterScreen.routeName: (context) =>
          const SearchFiltterScreen(),
          SearchResultScreen.routeName: (context) => const SearchResultScreen(),
          LayoutScreen.routeName: (context) => const LayoutScreen(),
          SelectImage.routeName: (context) => const SelectImage(),
        },
      );
  },
),
    );
  }
}
