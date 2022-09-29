import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class SearchHotelsUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  SearchHotelsUseCase(this.baseHotelsRepository);

  Future<Either<Failure, List<HotelDetailsForBookingModel>>> call(
      {
    required String name,
  }) async {
    return await baseHotelsRepository.getSearch(name);
  }
}
