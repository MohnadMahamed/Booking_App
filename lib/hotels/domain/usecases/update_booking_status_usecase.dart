import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';

class UpdateBookingStatusUseCase {
  final BaseHotelRepo baseHotelRepo;

  UpdateBookingStatusUseCase(this.baseHotelRepo);

  Future<Either<Failure, StatusModel>> call({
    required int bookingId,
    required String type,
  }) async {
    return await baseHotelRepo.CreateBooking(
      bookingId: bookingId,
      type: type,
    );
  }
}
