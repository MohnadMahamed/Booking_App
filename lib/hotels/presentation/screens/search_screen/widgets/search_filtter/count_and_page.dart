import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CountAndPageWiget extends StatefulWidget {
  const CountAndPageWiget({super.key});

  @override
  State<CountAndPageWiget> createState() => _CountAndPageWigetState();
}

class _CountAndPageWigetState extends State<CountAndPageWiget> {
  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (cubit.countValue < 20) {
                            cubit.countValue++;
                          } else {
                            Get.snackbar('Item count', "You can't add more !",
                                backgroundColor: AppColors.mainColor,
                                colorText: Colors.white);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        size: Dimensions.iconSize24,
                        color: Colors.white,
                      ),
                    ),
                    StaticColorText(
                      size: 14,
                      text: 'Count(${cubit.countValue})',
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (cubit.countValue > 1) {
                            cubit.countValue--;
                          } else {
                            Get.snackbar(
                                'Item count', "You can't reduce more !",
                                backgroundColor: AppColors.mainColor,
                                colorText: Colors.white);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.remove,
                        size: Dimensions.iconSize24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width10 / 2,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (cubit.pageValue < 20) {
                            cubit.pageValue++;
                          } else {
                            Get.snackbar('Item page', "You can't add more !",
                                backgroundColor: AppColors.mainColor,
                                colorText: Colors.white);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        size: Dimensions.iconSize24,
                        color: Colors.white,
                      ),
                    ),
                    StaticColorText(
                      text: 'Page(${cubit.pageValue})',
                      color: Colors.white,
                      size: 14,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (cubit.pageValue > 1) {
                            cubit.pageValue--;
                          } else {
                            Get.snackbar(
                                'Item count', "You can't reduce more !",
                                backgroundColor: AppColors.mainColor,
                                colorText: Colors.white);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.remove,
                        size: Dimensions.iconSize24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
