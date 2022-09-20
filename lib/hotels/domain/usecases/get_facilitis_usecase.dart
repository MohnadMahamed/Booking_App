import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';

class GetFacilitiesUseCase {
  final BaseHotelRepo baseHotelRepo;

  GetFacilitiesUseCase(this.baseHotelRepo);

  Future<Either<Failure,HotelFacilitiesModel>> call() async {
    return await baseHotelRepo.GetFacilities();
  }
}
