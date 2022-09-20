import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  final BaseHotelRepo baseHotelRepo;

  RegisterUseCase(this.baseHotelRepo);

  Future<Either<Failure, RegisterRequestModel>> call({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await baseHotelRepo.Register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
