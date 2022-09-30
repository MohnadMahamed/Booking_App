class ApiConstance {
  //http://api.mahmoudtaha.com/api/hotels?count=10&page=1
  //http://api.mahmoudtaha.com/api/auth/update-info
  //http://api.mahmoudtaha.com/api/create-booking
  //http://api.mahmoudtaha.com/api/get-bookings?type=completed&count=100
  //http://api.mahmoudtaha.com/api/facilities
  //http://api.mahmoudtaha.com/api/search-hotels?address=tanta&max_price=1000&min_price=&facilities[0]=1&facilities[1]=&latitude=&longitude=&distance=&count=&page=&name=
  static const basUrl = "http://api.mahmoudtaha.com/api";
  static const registerPath = "$basUrl/auth/register";
  static const loginPath = "$basUrl/auth/login";
  // static const getAllHottelsDetailsPath = "$basUrl/hotels?count=7";
  static const getAllHottelsDetailsPath = "$basUrl/hotels";
  static const updatePath = "$basUrl/auth/update-info";
  static const creatBookingPath = "$basUrl/create-booking";
  static const updateBookingStatusPath = "$basUrl/update-booking-status";
  static const getBookingsPath = "$basUrl/get-bookings";
  static const getFacilitiesPath = "$basUrl/facilities";
  static const searchHotelsPath = "$basUrl/search-hotels";
  static const getProfilePath = "$basUrl/auth/profile-info";
  // static const token = "AFhxM8ch7WPLH4GNrNW8MwmvxoQZPLkpgQbDGKC5stB7IBe5Bnl0GhOa0qB8";
  // static const token = "r4zyWr9bnAPluNcmjpPbOlidI4Xx6C6LpeJyvQ7PMs9oAlAq8ASmg6pOwG2b";
  // static const token = "NczOsFGcz3J7K7vjLajOHCm2762P8TK0eDe29yMsFzV6AgvSyjJDwNUsS7cG";
  // static var token = "qt4ZzZE9aCuJBordbZ7csvSfifrPnjw9zBEjMBtELtu5iA9v2CftranF2LYy";
  static var token = "3WffOf5uNFLv9ilHf7k6214R80GrNkKgjoJpcZGg97Qh2dt3TKuuL2wM9cOR";

}
String? token='';