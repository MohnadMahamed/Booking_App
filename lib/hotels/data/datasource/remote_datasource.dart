import 'dart:io';

import 'package:booking_app/core/error/exceptions.dart';
import 'package:booking_app/core/util/constaces/api_constances.dart';
import 'package:booking_app/hotels/data/datasource/network/local/shared_preferences.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dio/dio.dart';

import 'package:http_parser/http_parser.dart';



abstract class BaseRemoteDataSource {
  Future<UserDataModel> userRegister(RegisterRequestModel registerRequest);
  Future<UserDataModel> userLogin(LoginRequestModel loginRequestModel);
  Future<AllDataModel> getAllHotelsDetails(int pageNumber);
  Future<UserDataModel> updateUserInfo(
      String name,String email,File image);
  Future<UserDataDetailsModel> getInfo(
      );
  Future<BookingStateModel> createBooking(int userId, int hotelId);
  Future<StatusModel> updateBookingStatus(int bookingId, String type);
  Future<List<BookingModel>> getBookings(String type, int count);

  Future<List<HotelFacilityModel>> getFacilities();
  Future<List<HotelDetailsForBookingModel>> searchHotels(
      String address,
      );
  Future<List<HotelDetailsForBookingModel>> filterHotels(
      String? name,
      String? lat,
      String? lon,
      String? minPrice,
      String? maxPrice,
      String? distance,

      );
}
class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<UserDataModel> userRegister(
      RegisterRequestModel registerRequest) async {
    Dio dio = Dio();

    final response = await dio.post(ApiConstance.registerPath, data: {
      'name': registerRequest.name,
      'email': registerRequest.email,
      'image': registerRequest.image,
      'password': registerRequest.password,
      'password_confirmation': registerRequest.passwordConfirmation,
    });
    if (response.statusCode == 200) {
      print(response.data);
      //  user = UserDataModel(
      //     id: response.data.id,
      //     name: response.data.name,
      //     email: response.data.email,
      //     apiToken: response.data.apiToken,
      //     image: response.data.image,
      //     createdAt: response.data.createdAt,
      //     updatedAt: response.data.updatedAt);
      UserDataModel userData = UserDataModel.fromJson(response.data);
      return userData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<UserDataModel> userLogin(LoginRequestModel loginRequestModel) async {
    Dio dio = Dio();

    final response = await dio.post(ApiConstance.loginPath, data: {
      'email': loginRequestModel.email,
      'password': loginRequestModel.password,
    });
    if (response.statusCode == 200) {
      print(response.data);
      UserDataModel userData = UserDataModel.fromJson(response.data);
      return userData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<AllDataModel> getAllHotelsDetails(int pageNumber) async {
    Dio dio = Dio();

    final response = await dio
        .get("${ApiConstance.getAllHottelsDetailsPath}");
    if (response.statusCode == 200) {
      print(response.data);
      // return List<HotelFacilityModel>.from((response.data['data'] as List).map(
      //       (e) => HotelFacilityModel.fromJson(e),
      // ));
      AllDataModel allDataModel = AllDataModel.fromJson(response.data);

      return allDataModel;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }


  @override
  Future<UserDataModel> updateUserInfo(
      String name,String email,File image) async {
    Dio dio = Dio();
    String fileName = image.path.split('/').last;
    print(fileName);
    print(image.path);
    FormData formData =  FormData.fromMap({
      "name":name,
      'email': email,
      "image": await MultipartFile.fromFile(image.path,
          filename: fileName, contentType: MediaType('image', 'png') ),
      "type": "image/png"
    });
    dio.options.headers = {"token": CacheHelper.getData(key: 'token')};
    final response = await dio.post(ApiConstance.updatePath, data:formData );
    if (response.statusCode == 200) {
      print(response.data);
      UserDataModel userData = UserDataModel.fromJson(response.data);
      return userData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<BookingStateModel> createBooking(int userId,int hotelId) async {
    Dio dio = Dio();

    dio.options.headers = {'token': CacheHelper.getData(key: 'token')};

    final response = await dio.post(ApiConstance.creatBookingPath, data: {
      'user_id': userId,
      'hotel_id': hotelId,
    });
    if (response.statusCode == 200) {
      print(response.data);
      BookingStateModel statusData = BookingStateModel.fromJson(response.data);

      return statusData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<StatusModel> updateBookingStatus(int bookingId, String type) async {
    Dio dio = Dio();
    // dio.options.headers = {"token": CacheHelper.getData(key: 'token')};

    final response =
    await dio.post(ApiConstance.updateBookingStatusPath, data: {
      'booking_id': bookingId,
      'type': type,
    });
    if (response.statusCode == 200) {
      print(response.data);
      StatusModel statusData = StatusModel.fromJson(response.data["status"]);

      return statusData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<BookingModel>> getBookings(String type, int count) async {
    Dio dio = Dio();
    dio.options.headers = {"token": CacheHelper.getData(key: 'token')};

    final response = await dio
        .get("${ApiConstance.getBookingsPath}?type=$type&count=$count");
    if (response.statusCode == 200) {
      print(response.data["data"]["data"]);
      return List<BookingModel>.from(
          (response.data['data']["data"]).map(
                (e) => BookingModel.fromJson(e),
          ));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<HotelFacilityModel>> getFacilities() async {
    Dio dio = Dio();

    final response = await dio.get(ApiConstance.getFacilitiesPath);
    if (response.statusCode == 200) {
      print(response.data);
      return List<HotelFacilityModel>.from((response.data['data'] as List).map(
            (e) => HotelFacilityModel.fromJson(e),
      ));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<HotelDetailsForBookingModel>> searchHotels(
      String name,
      ) async {
    Dio dio = Dio();

    final response = await dio.get(
        "${ApiConstance.searchHotelsPath}?name=$name&count=10&page=1");
    if (response.statusCode == 200) {
      print(response.data);
      return List<HotelDetailsForBookingModel>.from(
          (response.data['data']['data'] ).map(
                (e) => HotelDetailsForBookingModel.fromJson(e),
          ));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<UserDataDetailsModel> getInfo()async {
    Dio dio = Dio();

    dio.options.headers = {"token": CacheHelper.getData(key: 'token')};
    final response=await dio.get("${ApiConstance.getProfilePath}");
    if (response.statusCode == 200) {
      print(response.data);
      UserDataDetailsModel userDataModel=UserDataDetailsModel.fromJson(response.data["data"]);
      return userDataModel;
    }else{
      throw ServerException(errorMessageModel: response.data);

    }
  }

  @override
  Future<List<HotelDetailsForBookingModel>> filterHotels(String? name, String? latitude, String? longitude, String? minPrice, String? maxPrice, String? distance) async{
    Dio dio = Dio();

    final response = await dio.get(
        "${ApiConstance.searchHotelsPath}?max_price=$maxPrice&min_price=$minPrice&latitude=$latitude&longitude=$longitude&distance=$distance&count=10&page=1&name=$name");
    if (response.statusCode == 200) {
      print(response.data);
      return List<HotelDetailsForBookingModel>.from(
          (response.data['data']['data'] ).map(
                (e) => HotelDetailsForBookingModel.fromJson(e),
          ));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
}