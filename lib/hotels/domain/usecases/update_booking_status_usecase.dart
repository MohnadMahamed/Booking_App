import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateBookingStatusUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  UpdateBookingStatusUseCase(this.baseHotelsRepository);

  Future<Either<Failure, StatusModel>> call(
    int bookingId,
    String type,
  ) async {
    return await baseHotelsRepository.getUpdateBookingStatus(
      bookingId,
      type,
    );
  }
}
