import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';

class GetBookingsUseCase {
  final BaseHotelRepo baseHotelRepo;

  GetBookingsUseCase(this.baseHotelRepo);

  Future<Either<Failure, BookingModel>> call({
    required String type,
    required int count,
  }) async {
    return await baseHotelRepo.GetBookings(
      type: type,
      count: count,
    );
  }
}
