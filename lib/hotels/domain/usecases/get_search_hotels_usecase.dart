import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class SearchHotelsUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  SearchHotelsUseCase(this.baseHotelsRepository);

  Future<Either<Failure, List<HotelDetailsModel>>> call(
    String address,
    String maxPrice,
    String minPrice,
    String facilities0,
    String facilities1,
    String name,
    double latitude,
    double longitude,
    double distance,
    int page,
    int count,
  ) async {
    return await baseHotelsRepository.getSearch(
        address,
        maxPrice,
        minPrice,
        facilities0,
        facilities1,
        latitude,
        longitude,
        distance,
        page,
        count,
        name);
  }
}
