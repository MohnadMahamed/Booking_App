import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int pageValue = 0;
int countValue = 0;

class CountAndPageWiget extends StatefulWidget {
  const CountAndPageWiget({super.key});

  @override
  State<CountAndPageWiget> createState() => _CountAndPageWigetState();
}

class _CountAndPageWigetState extends State<CountAndPageWiget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: Dimensions.width30 * 7.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (countValue < 20) {
                      countValue++;
                    } else {
                      Get.snackbar('Item count', "You can't add more !",
                          backgroundColor: AppColors.mainColor,
                          colorText: Colors.white);
                    }
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: Dimensions.iconSize24 * 1.5,
                  color: Colors.white,
                ),
              ),
              SmallText(
                text: 'Count($countValue)',
                color: Colors.white,
                size: Dimensions.font12 * 2,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (countValue > 0) {
                      countValue--;
                    } else {
                      Get.snackbar('Item count', "You can't reduce more !",
                          backgroundColor: AppColors.mainColor,
                          colorText: Colors.white);
                    }
                  });
                },
                icon: Icon(
                  Icons.remove,
                  size: Dimensions.iconSize24 * 1.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: Dimensions.width30 * 7.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (pageValue < 20) {
                      pageValue++;
                    } else {
                      Get.snackbar('Item page', "You can't add more !",
                          backgroundColor: AppColors.mainColor,
                          colorText: Colors.white);
                    }
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: Dimensions.iconSize24 * 1.5,
                  color: Colors.white,
                ),
              ),
              SmallText(
                text: 'Page($pageValue)',
                color: Colors.white,
                size: Dimensions.font12 * 2,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (pageValue > 0) {
                      pageValue--;
                    } else {
                      Get.snackbar('Item count', "You can't add more !",
                          backgroundColor: AppColors.mainColor,
                          colorText: Colors.white);
                    }
                  });
                },
                icon: Icon(
                  Icons.remove,
                  size: Dimensions.iconSize24 * 1.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
