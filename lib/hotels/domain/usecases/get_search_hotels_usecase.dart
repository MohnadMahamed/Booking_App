import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';

class SearchHotelsUseCase {
  final BaseHotelRepo baseHotelRepo;

  SearchHotelsUseCase(this.baseHotelRepo);

  Future<Either<Failure, HotelDetailsModel>> call({
    required String address,
    required String maxPrice,
    required String minPrice,
    required String facilities0,
    required String facilities1,
    required String name,
    required double latitude,
    required double longitude,
    required double distance,
    required int page,
    required int count,
  }) async {
    return await baseHotelRepo.SearchHotels(
      address: address,
      maxPrice: maxPrice,
      minPrice: minPrice,
      facilities0: facilities0,
      facilities1: facilities1,
      name: name,
      latitude: latitude,
      longitude: longitude,
      distance: distance,
      page: page,
      count: count,
    );
  }
}
