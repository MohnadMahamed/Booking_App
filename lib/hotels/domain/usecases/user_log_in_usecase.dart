import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final BaseHotelRepo baseHotelRepo;

  LoginUseCase(this.baseHotelRepo);

  Future<Either<Failure, RegisterRequestModel>> call({

    required String email,
    required String password,

  }) async {
    return await baseHotelRepo.Login(

      email: email,
      password: password,

    );
  }
}
