import 'package:booking_app/hotels/domain/entity/hotel_entity.dart';

class RegisterRequestModel extends RegisterRequest {
  const RegisterRequestModel(
      {required super.name,
      required super.email,
      required super.password,
      required super.passwordConfirmation,
      required super.image});

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        image: json["image"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "image": image,
    };
  }
}

class UserResponseModel extends UserResponse {
  const UserResponseModel(
      {required super.statusEntity, required super.userDataEntity});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
        statusEntity: StatusModel.fromJson(json["status"]),
        userDataEntity: UserDataModel.fromJson(json["data"]));
  }
}
class BookingStateModel extends BookingState{
 const BookingStateModel({required super.status, required super.bookingId});
 factory BookingStateModel.fromJson(Map<String, dynamic> json) {
   return BookingStateModel(
       status: StatusModel.fromJson(json["status"]),
       bookingId:json["booking_id"]);
 }

}
class StatusModel extends Status {
  const StatusModel({required super.type, required super.titleEntity});

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
        type: json["type"],
        titleEntity: ResponseTitleModel.fromJson(json["title"]));
  }
}

class ResponseTitleModel extends ResponseTitle {
  const ResponseTitleModel({required super.ar, required super.en});

  factory ResponseTitleModel.fromJson(Map<String, dynamic> json) {
    return ResponseTitleModel(ar: json["ar"], en: json["en"]);
  }
}

class UserDataModel extends UserData {
  const UserDataModel({
    required super.status,
    required super.userDataDetails,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      userDataDetails: UserDataDetailsModel.fromJson(json["data"]),
      status: StatusModel.fromJson(json["status"]),
    );
  }
}

class UserDataDetailsModel extends UserDataDetails {
  const UserDataDetailsModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.apiToken,
      required super.image,
      required super.createdAt,
      required super.updatedAt});

  factory UserDataDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDataDetailsModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        apiToken: json["api_token"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"]);
  }
}

class LoginRequestModel extends LoginRequest {
  const LoginRequestModel({required super.email, required super.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(email: json["name"], password: json["password"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

//

}

class HotelImageModel extends HotelImage {
  const HotelImageModel(
      {required super.id,
      required super.hotelId,
      required super.image,
      required super.createdAt,
      required super.updatedAt});

  factory HotelImageModel.fromJson(Map<String, dynamic> json) {
    return HotelImageModel(
        id: json["id"],
        hotelId: json["hotel_id"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"]);
  }
}

class HotelImagesModel extends HotelImages {
  const HotelImagesModel({required super.hotelImages});

  factory HotelImagesModel.fromJson(Map<String, dynamic> json) {
    return HotelImagesModel(
        hotelImages: List<HotelImageModel>.from(json["hotel_images"]
            .map((element) => HotelImagesModel.fromJson(element))));
  }
}

class HotelFacilityModel extends HotelFacility {
  const HotelFacilityModel(
      {required super.id,
      required super.hotelId,
      required super.image,
      required super.name,
      required super.facilityId,
      required super.createdAt,
      required super.updatedAt});

  factory HotelFacilityModel.fromJson(Map<String, dynamic> json) {
    return HotelFacilityModel(
        name: json["name"],
        id: json["id"],
        image: json["image"],
        hotelId: json["hotel_id"],
        facilityId: json["facility_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"]);
  }
}

class HotelFacilitiesModel extends HotelFacilities {
  const HotelFacilitiesModel({required super.hotelFacilities});

  factory HotelFacilitiesModel.fromJson(Map<String, dynamic> json) {
    return HotelFacilitiesModel(
        hotelFacilities: List<HotelFacility>.from(json["hotel_facilities"]
            .map((element) => HotelFacilityModel.fromJson(element))));
  }
}

class HotelDetailsModel extends HotelDetails {
  const HotelDetailsModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.price,
      required super.address,
      required super.longitude,
      required super.latitude,
      required super.rate,
      required super.createdAt,
      required super.updatedAt,
      required super.hotelFacilities,
      required super.hotelImages});

  factory HotelDetailsModel.fromJson(Map<String, dynamic> json) {
    return HotelDetailsModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      address: json["address"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      rate: json["rate"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      hotelFacilities: List<HotelFacility>.from(json["hotel_facilities"]
          .map((element) => HotelFacilityModel.fromJson(element))),
      hotelImages: List<HotelImage>.from(json["hotel_images"]
          .map((element) => HotelImageModel.fromJson(element))),
    );

// List<HotelDetailsModel>.from(json["data"].map((element)=>HotelDetailsModel.fromJson(element)))
// hotelImages: HotelImagesModel.fromJson(json["hotel_images"]));
  }
}

class HotelDetailsForBookingModel extends HotelDetailsForBooking {
  const HotelDetailsForBookingModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.price,
      required super.address,
      required super.longitude,
      required super.latitude,
      required super.rate,
      required super.createdAt,
      required super.updatedAt,
      required super.hotelFacilities,
      required super.hotelImages});

  factory HotelDetailsForBookingModel.fromJson(Map<String, dynamic> json) {
    return HotelDetailsForBookingModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      address: json["address"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      rate: json["rate"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      hotelFacilities: List<HotelFacility>.from(json["facilities"]
          .map((element) => HotelFacilityModel.fromJson(element))),
      hotelImages: List<HotelImage>.from(json["hotel_images"]
          .map((element) => HotelImageModel.fromJson(element))),
    );

// List<HotelDetailsModel>.from(json["data"].map((element)=>HotelDetailsModel.fromJson(element)))
// hotelImages: HotelImagesModel.fromJson(json["hotel_images"]));
  }
}

class BookingModel extends Booking {
  const BookingModel(
      {required super.bookingId,
      required super.userId,
      required super.hotelId,
      required super.type,
      required super.createdAt,
      required super.updatedAt,
      required super.userData,
      required super.hotelDetailsForBookingModel});

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      bookingId: json["id"],
      userId: json["user_id"],
      hotelId: json["hotel_id"],
      type: json["type"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      userData: UserDataDetailsModel.fromJson(json["user"]),
      hotelDetailsForBookingModel:
          HotelDetailsForBookingModel.fromJson(json["hotel"]),
    );
  }
//

}

class UpdateProfileRequestModel extends UpdateProfileRequest {
  const UpdateProfileRequestModel(
      {required super.name, required super.email, required super.image});

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileRequestModel(
        name: json["name"], email: json["email"], image: json["image"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "image": image,
    };
  }
}

class AllDataModel extends AllData {
  const AllDataModel(
      {required super.currentPage,
      required super.hotelData,
      required super.to,
      required super.total});

  factory AllDataModel.fromJson(Map<String, dynamic> json) {
    return AllDataModel(
        currentPage: json["current_page"],
        hotelData: List<HotelDetailsModel>.from(json["data"]["data"]
            .map((element) => HotelDetailsModel.fromJson(element))),
        to: json["to"],
        total: json["total"]);
  }
}
