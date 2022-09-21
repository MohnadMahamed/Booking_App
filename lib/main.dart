import 'package:booking_app/hotels/presentation/screens/splach_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main()async {
  // RemoteDataSource remoteDataSource=RemoteDataSource();
  // RegisterRequestModel registerRequestModel=RegisterRequestModel(name: "hafez drrage", email: "mmmmmmmmmmmmmm@gmail.com", password: "1234567", passwordConfirmation: "1234567", image: "");
 // LoginRequestModel loginRequestModel=LoginRequestModel(email: "mmmmmmmmmmmmmm@gmail.com", password: "1234567");
  // remoteDataSource.getAllHotelsDetails(1);
 //  remoteDataSource.userLogin(loginRequestModel);
 //  remoteDataSource.createBooking(152, 9);
 //  remoteDataSource.getBookings("upcomming", 10);
 //  remoteDataSource.getFacilities();
 //  remoteDataSource.updateBookingStatus(113, "completed");
 //  remoteDataSource.updateUserInfo(registerRequestModel);
 //  remoteDataSource.searchHotels(page: "",count: "10",maxPrice: "5000",minPrice: "100",address: "",name: "",distance: "",latitude: "",longitude: "");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
