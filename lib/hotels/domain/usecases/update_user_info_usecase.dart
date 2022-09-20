import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';

class UpdateUserInfoUseCase {
  final BaseHotelRepo baseHotelRepo;

  UpdateUserInfoUseCase(this.baseHotelRepo);

  Future<Either<Failure, UserDataModel>> call({
    required String name,
    required String email,
    required String password,

  }) async {
    return await baseHotelRepo.UpdateUserInfo(
      name: name,
      email: email,
      password: password,
    );
  }
}

