part of 'hotel_cubit.dart';

abstract class HotelState {}

class HotelInitial extends HotelState {}

class UserRegisterLoadingState extends HotelState {}

class UserRegisterSuccessState extends HotelState {}


class LangEnStateSuccess extends HotelState {}
class LangArStateSuccess extends HotelState {}

class ChangeLanguageSuccessState extends HotelState {}
class SelectFacilityState extends HotelState {}


class UserLoginLoadingState extends HotelState {}

class UserLoginSuccessState extends HotelState {}
class UserLogOutLoadingState extends HotelState {}

class UserLogOutSuccessState extends HotelState {}

class UserUpdateInfoLoadingState extends HotelState {}

class UserUpdateInfoSuccessState extends HotelState {}
class UserInfoLoadingState extends HotelState {}

class UserInfoSuccessState extends HotelState {}

class GetAllBookingSuccessState extends HotelState {}

class GetAllBookingLoadingState extends HotelState {}

class GetAllHotelsLoadingState extends HotelState {}

class GetAllHotelsSuccessState extends HotelState {}

class GetHotelDetailsLoadingState extends HotelState {}

class GetHotelDetailsSuccessState extends HotelState {}

class UpdateBookingSuccessState extends HotelState {}

class UpdateBookingLoadingState extends HotelState {}

class SearchHotelsLoadingState extends HotelState {}

class SearchHotelsSuccessState extends HotelState {}

class GetAllFacilitiesLoadingState extends HotelState {}

class GetAllFacilitiesSuccessState extends HotelState {}

class CreateBookingLoadingState extends HotelState {}

class CreateBookingSuccessState extends HotelState {}

class HotelErrorState extends HotelState {}

class ChangeNavBarState extends HotelState {}

class ChangPassVisibilityState extends HotelState {}




class AppChangeHotelMode extends HotelState {}
