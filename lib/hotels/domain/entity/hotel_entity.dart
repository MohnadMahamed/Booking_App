import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? passwordConfirmation;
  final String? image;

  @override
  List<Object?> get props =>
      [name, email, password, passwordConfirmation, image];

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.image,
  });
}

class UserResponse extends Equatable {
  final Status? statusEntity;
  final UserData? userDataEntity;

  @override
  List<Object?> get props => [statusEntity, userDataEntity];

  const UserResponse({
    required this.statusEntity,
    required this.userDataEntity,
  });
}

class Status extends Equatable {
  final String? type;
  // final String? ar;
  // final String? en;

  final ResponseTitle? titleEntity;

  @override
  List<Object?> get props => [type, titleEntity];

  const Status({
    required this.type,
    // required this.ar,
    // required this.en,
    required this.titleEntity,
  });
}

class ResponseTitle extends Equatable {
  final String? ar;
  final String? en;

  @override
  List<Object?> get props => [ar, en];

  const ResponseTitle({
    required this.ar,
    required this.en,
  });
}

class UserData extends Equatable {
  final Status? status;
  final UserDataDetails userDataDetails;

  @override
  List<Object?> get props =>
      [userDataDetails,status];

  const UserData({
    required this.status,
    required this.userDataDetails,

  });
}



class UserDataDetails extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? apiToken;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  @override
  List<Object?> get props =>
      [id, name, email, apiToken, image, createdAt, updatedAt,];

  const UserDataDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.apiToken,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
}


class LoginRequest extends Equatable {
  final String? email;
  final String? password;

  @override
  List<Object?> get props => [email, password];

  const LoginRequest({
    required this.email,
    required this.password,
  });
}

class HotelImage extends Equatable {
  final int? id;
  final String? hotelId;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  @override
  List<Object?> get props => [id, hotelId, image, createdAt, updatedAt];

  const HotelImage({
    required this.id,
    required this.hotelId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
}

class HotelImages extends Equatable {
  final List<HotelImage>? hotelImages;

  @override
  List<Object?> get props => [hotelImages];

  const HotelImages({
    required this.hotelImages,
  });
}

class HotelFacility extends Equatable {
  final String? name;
  final int? id;
  final String? hotelId;
  final String? image;
  final String? facilityId;
  final String? createdAt;
  final String? updatedAt;

  @override
  List<Object?> get props => [id, hotelId, facilityId, createdAt, updatedAt,name,image];

  const HotelFacility({
    required this.id,
    required this.image,
    required this.name,
    required this.hotelId,
    required this.facilityId,
    required this.createdAt,
    required this.updatedAt,
  });
}

class HotelFacilities extends Equatable {
  final List<HotelFacility>? hotelFacilities;

  @override
  List<Object?> get props => [hotelFacilities];

  const HotelFacilities({
    required this.hotelFacilities,
  });
}

class HotelDetails extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final String? address;
  final String? longitude;
  final String? latitude;
  final String? rate;
  final String? createdAt;
  final String? updatedAt;
  // final HotelFacilities? hotelFacilities;
   final List<HotelFacility>? hotelFacilities;

  ///to do make it list
  // final HotelImages? hotelImages;
  final List<HotelImage>? hotelImages;

  ///to do make it list

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        address,
        longitude,
        latitude,
        rate,
        createdAt,
        updatedAt,
        hotelFacilities,
        hotelImages,
      ];

  const HotelDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
    required this.hotelFacilities,
    required this.hotelImages,
  });
}
class HotelDetailsForBooking extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final String? address;
  final String? longitude;
  final String? latitude;
  final String? rate;
  final String? createdAt;
  final String? updatedAt;
  // final HotelFacilities? hotelFacilities;
   final List<HotelFacility>? hotelFacilities;

  ///to do make it list
  // final HotelImages? hotelImages;
  final List<HotelImage>? hotelImages;

  ///to do make it list

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        address,
        longitude,
        latitude,
        rate,
        createdAt,
        updatedAt,
        hotelFacilities,
        hotelImages,
      ];

  const HotelDetailsForBooking({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
    required this.hotelFacilities,
    required this.hotelImages,
  });
}
class BookingState extends Equatable{

  final Status? status;
 final  int? bookingId;

  @override
  List<Object?> get props => [status,bookingId];

  const BookingState({
   required this.status,
    required this.bookingId,
  });
}
class Booking extends Equatable {
  final int? bookingId;
  final String? userId;
  final String? hotelId;
  final String? type;
  final String? createdAt;
  final String? updatedAt;
  final UserDataDetails? userData;
  final HotelDetailsForBooking? hotelDetailsForBookingModel;

  @override
  List<Object?> get props => [
        bookingId,
        userId,
        hotelId,
        type,
        createdAt,
        updatedAt,
        userData,
        hotelDetailsForBookingModel
      ];

  const Booking({
    required this.bookingId,
    required this.userId,
    required this.hotelId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.userData,
    required this.hotelDetailsForBookingModel,
  });
}

class UpdateProfileRequest extends Equatable {
  final String? name;
  final String? email;
  final String? image;

  @override
  List<Object?> get props => [name, email, image];

  const UpdateProfileRequest({
    required this.name,
    required this.email,
    required this.image,
  });
}
class AllData extends Equatable {
  final int? currentPage;
  final List<HotelDetails>? hotelData;
  final int? to;
  final int? total;
  @override
  List<Object?> get props => [currentPage,hotelData,to,total];

  const AllData({
    required  this.currentPage,
    required  this.hotelData,
    required  this.to,
    required  this.total,
  });
}

// class HotelsData extends Equatable {
//   final List<HotelDetails>? hotelsData;
//
//   @override
//   List<Object?> get props => [hotelsData];
//
//   const HotelsData({
//     required this.hotelsData,
//   });
// }
