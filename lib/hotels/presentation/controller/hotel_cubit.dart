import 'dart:io';
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:booking_app/hotels/domain/entity/hotel_entity.dart';
import 'package:booking_app/hotels/domain/usecases/create_booking_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/filter_hotel_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_all_hotels_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_bookings_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_facilitis_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_search_hotels_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/get_user_info_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/update_booking_status_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/update_user_info_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/user_log_in_usecase.dart';
import 'package:booking_app/hotels/domain/usecases/user_register_usecase.dart';
import 'package:booking_app/hotels/presentation/screens/booking_screen/booking_screen.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/hotels/presentation/screens/login_screen/login_screen.dart';
import 'package:booking_app/hotels/presentation/screens/user_profile_screen/user_profile_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/datasource/network/local/shared_preferences.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit(
      this.createBookingUseCase,
      this.getAllHotelsUseCase,
      this.getBookingsUseCase,
      this.getFacilitiesUseCase,
      this.searchHotelsUseCase,
      this.updateBookingStatusUseCase,
      this.updateUserInfoUseCase,
      this.filterHotelsUseCase,
      this.getUserInfo,
      this.loginUseCase,
      this.registerUseCase)
      : super(HotelInitial());

  static HotelCubit get(context) => BlocProvider.of(context);
  final CreateBookingUseCase createBookingUseCase;
  final GetAllHotelsUseCase getAllHotelsUseCase;
  final GetBookingsUseCase getBookingsUseCase;
  final GetFacilitiesUseCase getFacilitiesUseCase;
  final SearchHotelsUseCase searchHotelsUseCase;
  final UpdateBookingStatusUseCase updateBookingStatusUseCase;
  final UpdateUserInfoUseCase updateUserInfoUseCase;
  final FilterHotelsUseCase filterHotelsUseCase;
  final GetUserInfo getUserInfo;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  UserDataModel? registerDataModel;
  UserDataModel? loginDataModel;
  UserDataModel? updateInfoDataModel;
  UserDataDetails? userInfo;
  AllDataModel? allHotelsData;
  List<BookingModel> listOfBooking = [];
  BookingStateModel? createBookingResult;
  StatusModel? updateBookingResult;
  List<HotelFacilityModel> listOfHotelFacility = [];
  List<HotelDetailsForBookingModel> searchHotelList = [];
  List<HotelDetails> searchHotelLis = [];
  List<HotelImage> imageList = [];
  List<HotelImages> listOfImagesForEachHotel = [];
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  HotelDetails? hotelDetails;
  int userId = 0;
  List<BookingModel> listOfUpcomingBooking = [];
  List<BookingModel> listOfCancelledBooking = [];
  List<BookingModel> listOfCompletedBooking = [];
  double priceSliderStartValue = 10.0;
  double priceSliderEndValue = 500.0;
  bool wifiCheckBoxVaule = false;
  bool acCheckBoxVaule = false;
  TextEditingController hotelNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController searchResultController = TextEditingController();

  double distaceSliderValue = 20.0;
  int pageNumber = 0;
  int pageValue = 0;
  int countValue = 0;

  int currentIndex = 0;
  List<int> selectedFacilities = [];
  void selectFacility(int id) {
    if (selectedFacilities.contains(id)) {
      selectedFacilities.remove(id);
    } else {
      selectedFacilities.add(id);
    }

    emit(SelectFacilityState());
  }

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

  bool isPassword = true;
  IconData passwordSuffix = Icons.visibility_outlined;

  void changPassVisibility() {
    isPassword = !isPassword;
    passwordSuffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangPassVisibilityState());
  }

  bool isPasswordConfirm = true;
  IconData confirmSuffix = Icons.visibility_outlined;

  void changConfirmPassVisibility() {
    isPasswordConfirm = !isPasswordConfirm;
    confirmSuffix = isPasswordConfirm
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(ChangPassVisibilityState());
  }

  getDetails(int index) {
    emit(GetHotelDetailsLoadingState());
    hotelDetails = allHotelsData!.hotelData![index];
    print(hotelDetails!.name);
    emit(GetHotelDetailsSuccessState());
  }

  Future<Either<Failure, UserDataModel>> register(
      RegisterRequestModel registerRequest) async {
    emit(UserRegisterLoadingState());
    final result = await registerUseCase.call(registerRequest);
    result.fold((l) {
      print(l.message);
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      registerDataModel = r;
      print(r);
      userInfo = r.userDataDetails;
      userId = registerDataModel!.userDataDetails.id!;
      errorMassage = registerDataModel!.status!.titleEntity!.en!;
      emit(UserRegisterSuccessState());
    });
    getAllHotels(3);
    print(userId);
    // ApiConstance.token = registerDataModel!.apiToken!;
    CacheHelper.saveData(
        key: 'token', value: registerDataModel!.userDataDetails.apiToken!);

    return result;
  }

  Future<Either<Failure, UserDataModel>> login(
      LoginRequestModel loginRequestModel) async {
    emit(UserLoginLoadingState());

    final result = await loginUseCase.call(loginRequestModel);
    result.fold((l) {
      ServerFailure(l.message);
      print(l.message);

      emit(HotelErrorState());
    }, (r) {
      loginDataModel = r;
      userInfo = r.userDataDetails;
      errorMassage = loginDataModel!.status!.titleEntity!.en!;

      emit(UserLoginSuccessState());

      print(loginDataModel);
    });
    // userId=registerDataModel!.id!;
    //ApiConstance.token = loginDataModel!.apiToken!;
    CacheHelper.saveData(
        key: 'token', value: loginDataModel!.userDataDetails.apiToken);

    getAllHotels(3);
    print(userId);

    return result;
  }

  Future<Either<Failure, UserDataDetailsModel>> getInfo() async {
    emit(UserInfoLoadingState());

    final result = await getUserInfo.call();
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      userInfo = r;
      emit(UserInfoSuccessState());
      print(userInfo);
    });
    return result;
  }

  File? image;

  Future getImageFromGallery() async {
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(picker!.path);
    // String fileName = image!.path.split('/').last;

    // FormData data = FormData.fromMap({
    //   "image": await MultipartFile.fromFile(
    //     image!.path,
    //     filename: fileName,
    //   ),
    // });
  }

  Future getImageFromCamera() async {
    final picker = await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(picker!.path);
    // String fileName = image!.path.split('/').last;
    // FormData data = FormData.fromMap({
    //   "image": await MultipartFile.fromFile(
    //     image!.path,
    //     filename: fileName,
    //   ),
    // });

    // _upload(image!);
  }

  String imageUrl = "";
  Future<Either<Failure, UserDataModel>> updateUserInfo(
      String name, String email, File image) async {
    emit(UserUpdateInfoLoadingState());

    final result = await updateUserInfoUseCase.call(name, email, image);
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      updateInfoDataModel = r;
      imageUrl = r.userDataDetails.image!;
      emit(UserUpdateInfoSuccessState());
      print(updateInfoDataModel);
    });
    return result;
  }

  Future<Either<Failure, AllDataModel>> getAllHotels(int pageNumber) async {
    emit(GetAllHotelsLoadingState());

    final result = await getAllHotelsUseCase.call(pageNumber);
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      allHotelsData = r;
      print(allHotelsData);
      allHotelsData!.hotelData!.forEach((element) {
        // element.
        imageList = element.hotelImages!;
      });

      emit(GetAllHotelsSuccessState());
    });
    return result;
  }

  Future<Either<Failure, List<BookingModel>>> getAllBookings(
      String type, int count) async {
    emit(GetAllBookingLoadingState());

    final result = await getBookingsUseCase.call(type, count);
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      listOfBooking = r;
      // listOfBooking!.forEach((element) {
      //   // if(element.type==upcomming cancelled  completed)
      //   if(element.type=="upcomming" ){
      //     listOfUpcomingBooking.add(element);
      //   }if(element.type=="cancelled" ){
      //     listOfCancelledBooking.add(element);
      //   }
      //   if(element.type=="completed" ){
      //     listOfCompletedBooking.add(element);
      //   }
      // });
      print(listOfBooking);
      emit(GetAllBookingSuccessState());
    });
    return result;
  }

  Future<Either<Failure, List<BookingModel>>> getUpComingBook(
      String type, int count) async {
    listOfUpcomingBooking = [];
    emit(GetAllBookingLoadingState());

    final result = await getBookingsUseCase.call(type, count);
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      listOfUpcomingBooking = r;
      // listOfBooking!.forEach((element) {
      //   // if(element.type==upcomming cancelled  completed)
      //   if(element.type=="upcomming" ){
      //     listOfUpcomingBooking.add(element);
      //   }if(element.type=="cancelled" ){
      //     listOfCancelledBooking.add(element);
      //   }
      //   if(element.type=="completed" ){
      //     listOfCompletedBooking.add(element);
      //   }
      // });
      print(listOfBooking);
      emit(GetAllBookingSuccessState());
    });
    return result;
  }

  Future<Either<Failure, List<BookingModel>>> getCompletedBook(
      String type, int count) async {
    listOfCompletedBooking = [];

    emit(GetAllBookingLoadingState());

    final result = await getBookingsUseCase.call(type, count);
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      listOfCompletedBooking = r;
      // listOfBooking!.forEach((element) {
      //   // if(element.type==upcomming cancelled  completed)
      //   if(element.type=="upcomming" ){
      //     listOfUpcomingBooking.add(element);
      //   }if(element.type=="cancelled" ){
      //     listOfCancelledBooking.add(element);
      //   }
      //   if(element.type=="completed" ){
      //     listOfCompletedBooking.add(element);
      //   }
      // });
      print(listOfBooking);
      emit(GetAllBookingSuccessState());
    });
    return result;
  }

  Future<Either<Failure, List<BookingModel>>> getCanceledBook(
      String type, int count) async {
    listOfCancelledBooking = [];

    emit(GetAllBookingLoadingState());

    final result = await getBookingsUseCase.call(type, count);
    result.fold((l) {
      ServerFailure(l.message);
      emit(HotelErrorState());
    }, (r) {
      listOfCancelledBooking = r;
      // listOfBooking!.forEach((element) {
      //   // if(element.type==upcomming cancelled  completed)
      //   if(element.type=="upcomming" ){
      //     listOfUpcomingBooking.add(element);
      //   }if(element.type=="cancelled" ){
      //     listOfCancelledBooking.add(element);
      //   }
      //   if(element.type=="completed" ){
      //     listOfCompletedBooking.add(element);
      //   }
      // });
      print(listOfBooking);
      emit(GetAllBookingSuccessState());
    });
    return result;
  }

  Future<Either<Failure, BookingStateModel>> createBookings(
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

  Future<Either<Failure, List<HotelDetailsForBookingModel>>>
      searchHotels() async {
    String name = searchResultController.text;

    emit(SearchHotelsLoadingState());
    final result = await searchHotelsUseCase.call(
      name: name,
    );
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

  Future<Either<Failure, List<HotelDetailsForBookingModel>>>
      filterHotels() async {
    emit(SearchHotelsLoadingState());
    final result = await filterHotelsUseCase.call(
      distance: distaceSliderValue.toString(),
      maxPrice: priceSliderEndValue.toString(),
      minPrice: priceSliderStartValue.toString(),
      name: hotelNameController.text,
      lat: latitudeController.text,
      lon: longitudeController.text,
    );
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

  bool lang = true;

  void langStateEn() {
    //  lang=!lang;

    emit(LangEnStateSuccess());
  }

  void langStateAr() {
    lang = !lang;
    emit(LangArStateSuccess());
  }

  bool isDark = true;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeHotelMode());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeHotelMode());
      });
    }
  }

  changeLang(BuildContext context) async {
    // lang=!lang;

    if (context.locale == Locale('ar')) {
      await context.setLocale(const Locale('en'));
      Get.updateLocale(Locale('en'));
      // emit(LangEnStateSuccess());

    } else {
      await context.setLocale(const Locale('ar'));
      Get.updateLocale(Locale('ar'));

      // emit(LangArStateSuccess());
    }
  }

  String errorMassage = '';

  signOut(context) {
    CacheHelper.removeData(key: 'email');
    CacheHelper.removeData(key: 'password');
    CacheHelper.removeData(key: 'token');
    // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => LoginScreen()));

    // Navigator.of(context)
    //     .popUntil(ModalRoute.withName(Navigator.defaultRouteName));

    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (BuildContext context) =>
    //           LoginScreen(),
    //     ));

    emit(HotelInitial());
  }
}


  //
  // EasyLocalization(
  //     path: "assets/translations",
  //     supportedLocales: [
  //    const   Locale('en'),
  //       Locale('ar'),
  //     ],
  //     fallbackLocale:   Locale('en'),
  //     assetLoader:  CodegenLoader(),
  //     child:  RegisterScreen(),
  //   ));
  //
  //


