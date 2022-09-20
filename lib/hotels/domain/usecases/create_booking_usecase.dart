import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class CreateBookingUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  CreateBookingUseCase(this.baseHotelsRepository);

  Future<Either<Failure, StatusModel>> call(
    int userId,
    String hotelId,
  ) async {
    return await baseHotelsRepository.getCreateBooking(
      userId,
      hotelId,
    );
  }
}
