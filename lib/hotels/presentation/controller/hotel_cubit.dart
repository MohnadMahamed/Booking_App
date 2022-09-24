import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/entity/hotel_entity.dart';
import 'package:booking_app/hotels/domain/usecases/create_booking_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_all_hotels_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_bookings_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_facilitis_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_search_hotels_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/update_booking_status_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/update_user_info_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/user_log_in_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/user_register_usecase.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/booking_screen.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/hotels_main_screen.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/user_profile_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit(
      this.registerUseCase,
      this.loginUseCase,
      this.updateUserInfoUseCase,
      this.updateBookingStatusUseCase,
      this.searchHotelsUseCase,
      this.getFacilitiesUseCase,
      this.getBookingsUseCase,
      this.getAllHotelsUseCase,
      this.createBookingUseCase)
      : super(HotelInitial());

  static HotelCubit get(context) => BlocProvider.of(context);
  final CreateBookingUseCase createBookingUseCase;
  final GetAllHotelsUseCase getAllHotelsUseCase;
  final GetBookingsUseCase getBookingsUseCase;
  final GetFacilitiesUseCase getFacilitiesUseCase;
  final SearchHotelsUseCase searchHotelsUseCase;
  final UpdateBookingStatusUseCase updateBookingStatusUseCase;
  final UpdateUserInfoUseCase updateUserInfoUseCase;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  UserDataModel? registerDataModel;
  UserDataModel? loginDataModel;
  UserDataModel? updateInfoDataModel;
  AllDataModel? allHotelsData;
  List<BookingModel>? listOfBooking;
  StatusModel? createBookingResult;
  StatusModel? updateBookingResult;
  List<HotelFacilityModel>? listOfHotelFacility;
  List<HotelDetailsForBookingModel>? searchHotelList;
  List<HotelImage> imageList=[];
  List<HotelImages> listOfImagesForEachHotel=[];
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  HotelDetails? hotelDetails;

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    const BookingScreen(),
    const UserProfileScreen(),
  ];

  List<String> titles = [
    'Test 1',
    'Test 2',
    'Test 3',
  ];

  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
getDetails(int index){
  emit(GetHotelDetailsLoadingState());
  hotelDetails= allHotelsData!.hotelData![index];
  print(hotelDetails!.name);
  emit(GetHotelDetailsSuccessState());

}

  Future<Either<Failure, UserDataModel>> register(  RegisterRequestModel registerRequest
      )async{

    emit(UserRegisterLoadingState());
  final result=await registerUseCase.call( registerRequest);
   result.fold((l) {
    print(l.message);
    ServerFailure(l.message);  emit(HotelErrorState()
  );
  }, (r) {
     registerDataModel=r;
  print(r);
     emit(UserRegisterSuccessState());

   });
    getAllHotels(3);

  return result;



  }
  Future<Either<Failure, UserDataModel>> login(LoginRequestModel loginRequestModel)async{
  emit(UserLoginLoadingState());

  final result=await loginUseCase.call(loginRequestModel);
  result.fold((l){ ServerFailure(l.message);  emit(HotelErrorState());
  }, (r) {loginDataModel=r;
  emit(UserLoginSuccessState());
  print(loginDataModel);

  });
  getAllHotels(3);

  return result;


}
  Future<Either<Failure, UserDataModel>> updateUserInfo(RegisterRequestModel updateUserInfoRequest)async{
  emit(UserUpdateInfoLoadingState());

  final result=await updateUserInfoUseCase.call(updateUserInfoRequest);
  result.fold((l) { ServerFailure(l.message);  emit(HotelErrorState());
  }, (r) { updateInfoDataModel=r;
  emit(UserUpdateInfoSuccessState());
print(updateInfoDataModel);
  });
  return result;

}
  Future<Either<Failure, AllDataModel>> getAllHotels(int pageNumber)async{
  emit(GetAllHotelsLoadingState());

  final result=await getAllHotelsUseCase.call(pageNumber);
  result.fold((l) { ServerFailure(l.message);  emit(HotelErrorState());
  }, (r) {allHotelsData=r;
  print(allHotelsData);
allHotelsData!.hotelData!.forEach((element) {
  // element.
  imageList=element.hotelImages!;
});

  // allHotelsData!.hotelData!.forEach((element) {
  //   element.hotelImages!.forEach((element) {
  //     imageList.add(element);
  //   });
  //   // imageList=element.hotelImages;
  //   // imageList.add(element.);
  //
  // });
  emit(GetAllHotelsSuccessState());

  } );
  return result;

}
  // Future<Either<Failure, List<BookingModel>>> getAllBookings(String type ,int count)async {
  //   emit(GetAllBookingLoadingState());
  // }
  //   Future<Either<Failure, UserDataModel>> register(
  //       RegisterRequestModel registerRequest) async {
  //     emit(UserRegisterLoadingState());
  //     final result = await registerUseCase.call(registerRequest);
  //     result.fold((l) {
  //       print(l.message);
  //       ServerFailure(l.message);
  //       emit(HotelErrorState());
  //     }, (r) {
  //       registerDataModel = r;
  //       print(r);
  //       emit(UserRegisterSuccessState());
  //     });
  //
  //     return result;
  //   }
  //
  // Future<Either<Failure, UserDataModel>> login(
  //     LoginRequestModel loginRequestModel) async {
  //   emit(UserLoginLoadingState());
  //
  //   final result = await loginUseCase.call(loginRequestModel);
  //   result.fold((l) {
  //     ServerFailure(l.message);
  //     emit(HotelErrorState());
  //   }, (r) {
  //     loginDataModel = r;
  //     emit(UserLoginSuccessState());
  //     print(loginDataModel);
  //   });
  //   emit(UserLoginSuccessState());
  //
  //   return result;
  // }
  //
  // Future<Either<Failure, UserDataModel>> updateUserInfo(
  //     RegisterRequestModel updateUserInfoRequest) async {
  //   emit(UserUpdateInfoLoadingState());
  //
  //   final result = await updateUserInfoUseCase.call(updateUserInfoRequest);
  //   result.fold((l) {
  //     ServerFailure(l.message);
  //     emit(HotelErrorState());
  //   }, (r) {
  //     updateInfoDataModel = r;
  //     emit(UserUpdateInfoSuccessState());
  //     print(updateInfoDataModel);
  //   });
  //   return result;
  //   emit(UserUpdateInfoSuccessState());
  // }
  //
  // Future<Either<Failure, AllDataModel>> getAllHotels(int pageNumber) async {
  //   emit(GetAllHotelsLoadingState());
  //
  //   final result = await getAllHotelsUseCase.call(pageNumber);
  //   result.fold((l) {
  //     ServerFailure(l.message);
  //     emit(HotelErrorState());
  //   }, (r) {
  //     allHotelsData = r;
  //     print(allHotelsData);
  //     emit(GetAllHotelsSuccessState());
  //   });
  //   return result;
  // }
  //
  // Future<Either<Failure, List<BookingModel>>> getAllBookings(
  //     String type, int count) async {
  //   emit(GetAllBookingLoadingState());
  //
  //   final result = await getBookingsUseCase.call(type, count);
  //   result.fold((l) {
  //     ServerFailure(l.message);
  //     emit(HotelErrorState());
  //   }, (r) {
  //     listOfBooking = r;
  //     print(listOfBooking);
  //     emit(GetAllBookingSuccessState());
  //   });
  //   return result;
  // }

  Future<Either<Failure, StatusModel>> createBookings(
      int hotelId, int userId) async {
    emit(CreateBookingLoadingState());

    final result = await createBookingUseCase.call(userId, hotelId);
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      createBookingResult = r;
      print(createBookingResult);
      emit(CreateBookingSuccessState());
    });
    return result;
  }

  Future<Either<Failure, List<HotelFacilityModel>>> getAllFacilities() async {
    emit(GetAllFacilitiesLoadingState());

    final result = await getFacilitiesUseCase.call();
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      listOfHotelFacility = r;
      print(listOfHotelFacility);
      emit(GetAllFacilitiesSuccessState());
    });
    return result;
  }

  Future<Either<Failure, StatusModel>> updateBookings(
      String type, int bookingId) async {
    emit(UpdateBookingLoadingState());

    final result = await updateBookingStatusUseCase.call(bookingId, type);
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      updateBookingResult = r;
      print(updateBookingResult);
      emit(UpdateBookingSuccessState());
    });
    return result;
  }

  Future<Either<Failure, List<HotelDetailsForBookingModel>>> searchHotels(
      {required String address,
      required String maxPrice,
      required String minPrice,
      required String name,
      required String latitude,
      required String longitude,
      required String distance,
      required String page,
      required String count}) async {
    emit(SearchHotelsLoadingState());
    final result = await searchHotelsUseCase.call(
        name: name,
        address: address,
        minPrice: minPrice,
        maxPrice: maxPrice,
        count: count,
        page: page,
        longitude: longitude,
        latitude: latitude,
        distance: distance);
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      searchHotelList = r;
      print(searchHotelList);
      emit(SearchHotelsSuccessState());
    });
    return result;
  }
}
