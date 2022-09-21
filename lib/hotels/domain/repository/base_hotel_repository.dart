import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../data/datasource/remote_datasource.dart';

abstract class BaseHotelsRepository{
 final BaseRemoteDataSource baseHotelRemoteDataSource;
 BaseHotelsRepository(this.baseHotelRemoteDataSource);

  Future<Either<Failure,UserDataModel>> getUserRegister(
      RegisterRequestModel registerRequest);
  Future<Either<Failure,UserDataModel>> getUserLogin(
      LoginRequestModel loginRequestModel);
  Future<Either<Failure,AllDataModel>> getAllHotelsDetails(
      int pageNumber);
  Future<Either<Failure,UserDataModel>> getUpdateUserInfo(
      RegisterRequestModel updateUserInfoRequest);
  Future<Either<Failure,StatusModel>> getCreateBooking(
      int userId, int hotelId);
  Future<Either<Failure,StatusModel>> getUpdateBookingStatus(
      int bookingId, String type);
  Future<Either<Failure,List<BookingModel>>> getBookings(
      String type, int count);
  Future<Either<Failure,List<HotelFacilityModel>>> getFacilities();
  Future<Either<Failure,List<HotelDetailsForBookingModel>>> getSearch(
      {required String address,
       required String maxPrice,
       required String minPrice,
      // String facilities0,
      // String facilities1,
       required  String latitude,
       required   String longitude,
       required  String distance,
       required   String page,
       required   String count,
       required   String name});
}
