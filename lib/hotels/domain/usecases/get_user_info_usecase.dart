
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserInfo {
  final BaseHotelsRepository baseHotelsRepository;

  GetUserInfo(this.baseHotelsRepository);



  Future<Either<Failure, UserDataDetailsModel>> call() async {
    return await baseHotelsRepository.getInfo();
  }
}

