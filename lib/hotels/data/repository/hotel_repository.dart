import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repository/base_hotel_repository.dart';

class HotelsRepository extends BaseHotelsRepository{
  HotelsRepository(super.baseHotelRemoteDataSource);
  @override
  Future<Either<Failure, UserDataModel>> getUserRegister(RegisterRequestModel registerRequest) async {
    final result=await baseHotelRemoteDataSource.userRegister(  registerRequest);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> getUserLogin(LoginRequestModel loginRequestModel) async {
    final result=await baseHotelRemoteDataSource.userLogin( loginRequestModel);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,AllDataModel>> getAllHotelsDetails(int pageNumber) async {
    final result=await baseHotelRemoteDataSource.getAllHotelsDetails(pageNumber);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> getUpdateUserInfo(RegisterRequestModel updateUserInfoRequest) async {
    final result=await baseHotelRemoteDataSource.updateUserInfo(updateUserInfoRequest);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, StatusModel>> getCreateBooking(int userId, int hotelId) async {
    final result=await baseHotelRemoteDataSource.createBooking( userId, hotelId);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, StatusModel>> getUpdateBookingStatus(int bookingId, String type) async {
    final result=await baseHotelRemoteDataSource.updateBookingStatus( bookingId, type);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<BookingModel>>> getBookings(String type, int count) async {
    final result=await baseHotelRemoteDataSource.getBookings( type,count);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<HotelFacilityModel>>> getFacilities() async {
    final result=await baseHotelRemoteDataSource.getFacilities() ;

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<HotelDetailsForBookingModel>>> getSearch(
      {required String address,
        required  String maxPrice,
        required   String minPrice,
        required   String latitude,
        required   String longitude,
        required   String distance,
        required   String page,
        required    String count,
        required   String name}) async {
    final result=await baseHotelRemoteDataSource.searchHotels() ;

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}





