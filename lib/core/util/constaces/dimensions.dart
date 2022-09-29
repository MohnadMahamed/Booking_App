import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

//width => 411
//height => 683

  //dynamic height padding and margin
  static double height10 = screenHeight / 68.10;
  static double height15 = screenHeight / 45.53;
  static double height20 = screenHeight / 34.15;
  static double height30 = screenHeight / 22.76;
  static double height45 = screenHeight / 15.17;

  //dynamic height padding and margin
  static double width10 = screenWidth / 41.1;
  static double width15 = screenWidth / 17.4;
  static double width20 = screenWidth / 20.55;
  static double width30 = screenWidth / 13.7;

  //font size
  static double font12 = screenWidth / 34.25;
  static double font10 = screenWidth / 41.1;
  static double font16 = screenWidth / 25.69;
  static double font20 = screenWidth / 20.55;
  static double font26 = screenWidth / 15.81;
  static double font30 = screenWidth / 13.7;

  //radius
  static double radius15 = screenWidth / 27.4;
  static double radius20 = screenWidth / 20.55;
  static double radius30 = screenWidth / 13.70;
  static double radius70 = screenWidth / 5.87;
  static double radius73 = screenWidth / 5.63;
  static double radius80 = screenWidth / 5.14;
  static double radius83 = screenWidth / 4.95;

  //icon size
  static double iconSize16 = screenWidth / 25.69;
  static double iconSize24 = screenWidth / 17.16;
  static double iconSize30 = screenWidth / 13.7;

  //sliver app bar
  static double carouselrHeight = screenHeight / 1.366; //500
  static double homeExpandedHeight = screenHeight / 1.8; //380
  static double homeToolBarHeight = screenHeight / 6.83; //100
  static double detailsToolBarHeight = screenHeight / 4.55; //150
  static double detailsTogleHeight = screenHeight / 1.366; //500
  static double hotelItemHeight = screenHeight / 4.02; //170
  static double hotelMapItemHeight = screenHeight / 5.25; //130
  static double hotelMapItemWidth = screenWidth / 1.37; //300
  static double ratingHotelHeight = screenHeight / 3.10; //220
  static double cardDetaialsImageHeight = screenHeight / 3.10; //220
  static double cardMoreDetaialsHeight = screenHeight / 11.38; //60
  static double cardMoreDetaialsWidth = screenWidth / 2.055; //200
  static double leadingDetaialsWidth = screenWidth / 4.11; //100
  static double bookingItemHeight = screenHeight / 2.63; //260

}
