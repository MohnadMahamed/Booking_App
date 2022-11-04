import 'package:booking_app/core/services/blocobserver.dart';
import 'package:booking_app/core/services/services_locator.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/resources/codegen_loader.g.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/booking_screen.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/hotels/presentation/screens/image_screen.dart';
import 'package:booking_app/hotels/presentation/screens/login_screen/login_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_map_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_result_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_filtter_screen.dart';
import 'package:booking_app/hotels/presentation/screens/splash_screen/splash_widgets.dart';
import 'package:booking_app/hotels/presentation/styles/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'hotels/data/datasource/network/local/shared_preferences.dart';
import 'hotels/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'hotels/presentation/screens/register_screen/register_screen.dart';

void main() async {
  ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  //Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      bool? isDark = CacheHelper.getData(key: 'isDark');

      runApp(EasyLocalization(
        path: "assets/translations",
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        // fallbackLocale:   Locale('en'),
        assetLoader: const CodegenLoader(),
        child: MyApp(
          isDark: isDark,
          // startWidget: widget
        ),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp({super.key, this.isDark});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit(
          sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl())
        ..changeAppMode(fromShared: isDark),
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashWidget(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: HotelCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            routes: {
              SplashWidget.routeName: (context) => const SplashWidget(),
              OnBoradingScreen.routeName: (context) => const OnBoradingScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              DetailsScreen.routeName: (context) => const DetailsScreen(),
              SearchFiltterScreen.routeName: (context) =>
                  const SearchFiltterScreen(),
              SearchResultScreen.routeName: (context) =>
                  const SearchResultScreen(),
              SearchMapScreen.routeName: (context) => const SearchMapScreen(),
              LayoutScreen.routeName: (context) => const LayoutScreen(),
              SelectImage.routeName: (context) => const SelectImage(),
              BookingScreen.routeName: (context) => const BookingScreen(),
            },
          );
        },
      ),
    );
  }
}
