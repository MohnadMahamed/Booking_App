import 'package:booking_app/hotels/data/repository/hotel_repository.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;
class ServiceLocator{
  void init(){

    ///bloc
  //  sl.registerFactory(() => HotelsBloc(sl(),sl(),sl()));
    /// Use Case
    sl.registerLazySingleton(() => (sl()));
    sl.registerLazySingleton(() => (sl()));
    sl.registerLazySingleton(() => (sl()));
    /// Repository
    sl.registerLazySingleton<BaseHotelsRepository>(() => HotelsRepository(sl()));
    /// Data Source
  //  sl.registerLazySingleton<BaseHotelRemoteDataSource>(() => HotelRemoteDataSource());
  }
}

// class BaseHotelRemoteDataSource {
// }
//  class HotelRemoteDataSource extends BaseHotelRemoteDataSource{
//
//  }