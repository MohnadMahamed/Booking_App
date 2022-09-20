import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';

class CreateBookingUseCase {
  final BaseHotelRepo baseHotelRepo;

  CreateBookingUseCase(this.baseHotelRepo);

  Future<Either<Failure, StatusModel>> call({
    required String userId,
    required String hotelId,
  }) async {
    return await baseHotelRepo.CreateBooking(
      userId: userId,
      hotelId: hotelId,
    );
  }
}
