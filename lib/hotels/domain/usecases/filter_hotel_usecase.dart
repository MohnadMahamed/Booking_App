import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class FilterHotelsUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  FilterHotelsUseCase(this.baseHotelsRepository);

  Future<Either<Failure, List<HotelDetailsForBookingModel>>> call(
      {
        String? name,
        String? lat,
        String? lon,
        String? minPrice,
        String? maxPrice,
        String? distance,
      }) async {
    return await baseHotelsRepository.filterHotels(name, lat, lon, minPrice, maxPrice, distance);
  }
}
