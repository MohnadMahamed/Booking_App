import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class GetBookingsUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  GetBookingsUseCase(this.baseHotelsRepository);

  Future<Either<Failure, List<BookingModel>>> call(
    String type,
  int count,
  ) async {
    return await baseHotelsRepository.getBookings(type, count);
  }
}
