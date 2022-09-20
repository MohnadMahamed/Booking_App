import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  RegisterUseCase(this.baseHotelsRepository);

  Future<Either<Failure, UserDataModel>> call(RegisterRequestModel registerRequest) async {
    return await baseHotelsRepository.getUserRegister(registerRequest);
  }
}
