import 'dart:io';

import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateUserInfoUseCase {
  final BaseHotelsRepository baseHotelsRepository;

  UpdateUserInfoUseCase(this.baseHotelsRepository);



  Future<Either<Failure, UserDataModel>> call(String name,String email,File image) async {
    return await baseHotelsRepository.getUpdateUserInfo(name,email,image);
  }
}

