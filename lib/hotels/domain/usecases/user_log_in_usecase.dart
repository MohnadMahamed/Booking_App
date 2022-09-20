import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  LoginUseCase(this.baseHotelsRepository);

  Future<Either<Failure, UserDataModel>> call(LoginRequestModel loginRequestModel) async {
    return await baseHotelsRepository.getUserLogin(loginRequestModel);
  }
}
