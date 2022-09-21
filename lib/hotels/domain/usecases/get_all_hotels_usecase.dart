import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllHotelsUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  GetAllHotelsUseCase(this.baseHotelsRepository);
  Future<Either<Failure, AllDataModel>> call(
  int pageNumber
) async {
    return await baseHotelsRepository.getAllHotelsDetails(pageNumber);
  }
}
