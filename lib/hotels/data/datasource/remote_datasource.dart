import 'package:booking_app/core/error/exceptions.dart';
import 'package:booking_app/core/util/constaces/api_constances.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource {
  Future<UserDataModel> userRegister(RegisterRequestModel registerRequest);
  Future<UserDataModel> userLogin(LoginRequestModel loginRequestModel);
  Future<AllDataModel> getAllHotelsDetails(int pageNumber);
  Future<UserDataModel> updateUserInfo(
      RegisterRequestModel updateUserInfoRequest);
  Future<StatusModel> createBooking(int userId, int hotelId);
  Future<StatusModel> updateBookingStatus(int bookingId, String type);
  Future<List<BookingModel>> getBookings(String type, int count);

  Future<List<HotelFacilityModel>> getFacilities();
  Future<List<HotelDetailsForBookingModel>> searchHotels(
      {String address,
      String maxPrice,
      String minPrice,
      // String facilities0,
      // String facilities1,
      String latitude,
      String longitude,
      String distance,
      String page,
      String count,
      String name});
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<UserDataModel> userRegister(
      RegisterRequestModel registerRequest) async {
    Dio dio = Dio();
    // dio.options.headers = {
    //   'token': 'PostmanRuntime/7.29.2',
    //   'Accept': '*/*',
    //   'Accept-Encoding': 'gzip, deflate, br',
    //   'Connection': 'keep-alive',
    // };

    final response = await dio.post(ApiConstaces.registerPath, data: {
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
      UserDataModel userData = UserDataModel.fromJson(response.data["data"]);
      return userData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<UserDataModel> userLogin(LoginRequestModel loginRequestModel) async {
    Dio dio = Dio();

    final response = await dio.post(ApiConstaces.loginPath, data: {
      'email': loginRequestModel.email,
      'password': loginRequestModel.password,
    });
    if (response.statusCode == 200) {
      print(response.data);
      UserDataModel userData = UserDataModel.fromJson(response.data["data"]);
      return userData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<AllDataModel> getAllHotelsDetails(int pageNumber) async {
    Dio dio = Dio();

    final response = await dio
        .get("${ApiConstaces.getAllHottelsDetailsPath}&page=$pageNumber");
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
      RegisterRequestModel updateUserInfoRequest) async {
    Dio dio = Dio();

    dio.options.headers = {"token": ApiConstaces.token};

    final response = await dio.post(ApiConstaces.updatePath, data: {
      'name': updateUserInfoRequest.name,
      'email': updateUserInfoRequest.email,
      'image': updateUserInfoRequest.image,
    });
    if (response.statusCode == 200) {
      print(response.data);
      UserDataModel userData = UserDataModel.fromJson(response.data["data"]);
      return userData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<StatusModel> createBooking(int userId,int hotelId) async {
    Dio dio = Dio();

    dio.options.headers = {'token': ApiConstaces.token};

    final response = await dio.post(ApiConstaces.creatBookingPath, data: {
      'user_id': userId,
      'hotel_id': hotelId,
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
  Future<StatusModel> updateBookingStatus(int bookingId, String type) async {
    Dio dio = Dio();
    dio.options.headers = {"token": ApiConstaces.token};
    final response =
        await dio.post(ApiConstaces.updateBookingStatusPath, data: {
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
    dio.options.headers = {"token": ApiConstaces.token};

    final response = await dio
        .get("${ApiConstaces.getBookingsPath}?type=$type&count=$count");
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

    final response = await dio.get(ApiConstaces.getFacilitiesPath);
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
      {String? address,
      String? maxPrice,
      String? minPrice,
      // String? facilities0,
      // String? facilities1,
      String? latitude,
      String? longitude,
      String? distance,
      String? count,
      String? page,
      String? name}) async {
    Dio dio = Dio();

    final response = await dio.get(
        "${ApiConstaces.searchHotelsPath}?address=$address&max_price=$maxPrice&min_price=$minPrice&latitude=$latitude&longitude=$longitude&distance=$distance&count=$count&page=$page&name=$name");
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
