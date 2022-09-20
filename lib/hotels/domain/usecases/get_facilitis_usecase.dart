import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class GetFacilitiesUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  GetFacilitiesUseCase(this.baseHotelsRepository);

  Future<Either<Failure, List<HotelFacilityModel>>> call() async {
    return await baseHotelsRepository.getFacilities();
  }
}
