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

class UserDataModel extends UserData {
  const UserDataModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.apiToken,
      required super.image,
      required super.createdAt,
      required super.updatedAt});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
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
      required super.facilityId,
      required super.createdAt,
      required super.updatedAt});

  factory HotelFacilityModel.fromJson(Map<String, dynamic> json) {
    return HotelFacilityModel(
        id: json["id"],
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
        hotelFacilities:
            HotelFacilitiesModel.fromJson(json["hotel_facilities"]),
        hotelImages: HotelImagesModel.fromJson(json["hotel_images"]));
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
      required super.hotelDetails});

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      bookingId: json["id"],
      userId: json["user_id"],
      hotelId: json["hotel_id"],
      type: json["type"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      userData: UserDataModel.fromJson(json["user"]),
      hotelDetails: HotelDetailsModel.fromJson(json["hotel"]),
    );
  }
//

}

// class HotelsDataModel extends HotelsData {
//   const HotelsDataModel({required super.hotelsData});
//
//   factory HotelsDataModel.fromJson(Map<String, dynamic> json) {
//     return HotelsDataModel(hotelsData: List<HotelDetailsModel>.from(json["data"].map((element)=>HotelDetailsModel.fromJson(element))));
//   }
//
//
// }
