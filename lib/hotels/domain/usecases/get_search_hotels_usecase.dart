import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class SearchHotelsUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  SearchHotelsUseCase(this.baseHotelsRepository);

  Future<Either<Failure, List<HotelDetailsForBookingModel>>> call(
      {
    String? address,
         String? maxPrice,
         String? minPrice,
    // String facilities0,
    // String facilities1,
         String? name,
         String? latitude,
         String? longitude,
         String? distance,
         String? page,
         String? count,
  }) async {
    return await baseHotelsRepository.getSearch(address: address, maxPrice: maxPrice, minPrice: minPrice, latitude: latitude, longitude: longitude, distance: distance, page: page, count: count, name: name);
  }
}
