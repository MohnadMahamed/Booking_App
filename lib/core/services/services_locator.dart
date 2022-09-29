import 'package:booking_app/hotels/data/datasource/remote_datasource.dart';
import 'package:booking_app/hotels/data/repository/hotel_repository.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:booking_app/hotels/domain/usecases/create_booking_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/filter_hotel_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_all_hotels_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_bookings_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_facilitis_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_search_hotels_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_user_info_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/update_booking_status_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/update_user_info_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/user_log_in_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/user_register_usecase.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///bloc
    sl.registerFactory(() => HotelCubit(
        sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));

    /// Use Case
    sl.registerLazySingleton(() => CreateBookingUseCase(sl()));
    sl.registerLazySingleton(() => GetAllHotelsUseCase(sl()));
    sl.registerLazySingleton(() => GetBookingsUseCase(sl()));
    sl.registerLazySingleton(() => GetFacilitiesUseCase(sl()));
    sl.registerLazySingleton(() => SearchHotelsUseCase(sl()));
    sl.registerLazySingleton(() => UpdateBookingStatusUseCase(sl()));
    sl.registerLazySingleton(() => UpdateUserInfoUseCase(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => GetUserInfo(sl()));
    sl.registerLazySingleton(() => FilterHotelsUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseHotelsRepository>(
        () => HotelsRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    // shared prefs instance
    // final sharedPrefs =  SharedPreferences.getInstance();
    // sl.registerLazySingleton(() => sharedPrefs);
    // sl.registerLazySingleton<AppPreference>(() => AppPreferences(sl()));
  }
}

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
}
