class ApiConstaces {
  //http://api.mahmoudtaha.com/api/hotels?count=10&page=1
  //http://api.mahmoudtaha.com/api/auth/update-info
  //http://api.mahmoudtaha.com/api/create-booking
  //http://api.mahmoudtaha.com/api/get-bookings?type=completed&count=100
  //http://api.mahmoudtaha.com/api/facilities
  //http://api.mahmoudtaha.com/api/search-hotels?address=tanta&max_price=1000&min_price=&facilities[0]=1&facilities[1]=&latitude=&longitude=&distance=&count=&page=&name=
  static const basUrl = "http://api.mahmoudtaha.com/api";
  static const registerPath = "$basUrl/auth/register";
  static const loginPath = "$basUrl/auth/login";
  static const getAllHottelsDetailsPath = "$basUrl/hotels?count=10";
  static const updatePath = "$basUrl/auth/update-info";
  static const creatBookingPath = "$basUrl/create-booking";
  static const updateBookingStatusPath = "$basUrl/update-booking-status";
  static const getBookingsPath = "$basUrl/get-bookings";
  static const getFacilitiesPath = "$basUrl/facilities";
  static const searchHotelsPath = "$basUrl/search-hotels";
  static const token = "";
}
