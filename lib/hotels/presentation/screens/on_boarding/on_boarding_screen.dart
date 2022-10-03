import 'package:booking_app/app/app_prefs.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
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
      image: 'assets/images/board2.jpeg',
      title: 'Booking Hotel Become Easily',
      body: 'Find your hotel from thousands hotels !',
    ),
    BordingModel(
      image: 'assets/images/bord3.jpeg',
      title: 'Go Booking Now',
      body: 'Easily booking any hotel , you want!',
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
      body: Padding(
        padding: EdgeInsets.all(Dimensions.width20),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height30,
            ),
            Align(
              alignment: Alignment.topRight,
              child: MyButtonWidget(
                isPadding: false,
                width: 100,
                height: 50,
                text: 'Skip',
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterScreen.routeName);
                },
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
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
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 2,
                    dotWidth: 15,
                    spacing: 8,
                    activeDotColor: Colors.teal,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: HotelCubit.get(context).isDark
                      ? Colors.white70
                      : Colors.black,
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.teal,
                  ),
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
              child: SizedBox(
                width: double.infinity,
                height: 500,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    model.image,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height20),
          BigText(
            text: model.title,
            size: Dimensions.font20,
            maxLines: 2,
          ),
          SizedBox(height: Dimensions.height10),
          SmallText(
            text: model.body,
            size: Dimensions.font20,
          ),
        ],
      );
}
