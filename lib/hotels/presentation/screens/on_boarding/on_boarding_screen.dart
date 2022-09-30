import 'package:booking_app/app/app_prefs.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/services/services_locator.dart';
import '../../../data/datasource/network/local/shared_preferences.dart';
import '../../../domain/usecases/user_log_in_usecase.dart';
import '../../components/widgets/my_button_widget.dart';
import '../register_screen/register_screen.dart';

class BordingModel {
  final String image;
  final String title;
  final String body;

  BordingModel({required this.image, required this.title, required this.body});
}

class OnBoradingScreen extends StatefulWidget {
  static const routeName = 'OnBoradingScreen';

  const OnBoradingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

 class _OnBoradingScreenState extends State<OnBoradingScreen> {


  var boardController = PageController();


  List<BordingModel> boarding = [
    BordingModel(
      image: 'assets/images/onboard.png',
      title: 'Booking Anything',
      body: 'Find your hotel from , thousands of hotels !',
    ),
    BordingModel(
      image: 'assets/images/1.jpg',
      title: 'Booking Easily',
      body: 'Easily booking any hotel , you want to stay in !',
    ),
  ];
  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {


      if (value) {
        print(value);
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MyButtonWidget(
            width: 60,
            text: 'Skip',
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, RegisterScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                    activeDotColor: Colors.teal,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: HotelCubit.get(context).isDark? Colors.black54 : Colors.white70,

                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios,color: Colors.teal,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BordingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: 400,
                width: double.infinity,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    '${model.image}',

                  ),

                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            '${model.title}',
            style:Theme.of(context).textTheme.headline5
          ),
          SizedBox(height: 15.0),
          Text(
            '${model.body}',
            style:Theme.of(context).textTheme.bodyText1

  ),
          SizedBox(height: 30.0),
        ],
      );
}
