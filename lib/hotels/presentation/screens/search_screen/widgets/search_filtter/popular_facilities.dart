import 'dart:developer';

import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularFacilitiesWidget extends StatefulWidget {
  const PopularFacilitiesWidget({super.key});

  @override
  State<PopularFacilitiesWidget> createState() =>
      _PopularFacilitiesStateWidget();
}

class _PopularFacilitiesStateWidget extends State<PopularFacilitiesWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (cubit.listOfHotelFacility.isNotEmpty) {
          return Wrap(
            runSpacing: 16.0,
            spacing: 16.0,
            children: [
              ...cubit.listOfHotelFacility
                  .asMap()
                  .map(
                    (key, value) => MapEntry(
                      key,
                      InkWell(
                        onTap: () {
                          cubit.selectFacility(value.id!);
                        },
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: cubit.selectedFacilities
                                    .any((element) => element == value.id)
                                ? Colors.teal
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(value.image!,
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    value.name!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ],
          );
        } else {
          return Container();
        }

        // return Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Row(
        //       children: [
        //         Checkbox(
        //           value: cubit.wifiCheckBoxVaule,
        //           activeColor: AppColors.mainColor,
        //           side: const BorderSide(
        //             color: Colors.white24,
        //             width: 2,
        //           ),
        //           shape: const RoundedRectangleBorder(
        //               borderRadius: BorderRadius.all(Radius.circular(5.0))),
        //           splashRadius: 20.0,
        //           onChanged: (value) {
        //             setState(() {
        //               cubit. wifiCheckBoxVaule = value!;
        //               log(cubit.wifiCheckBoxVaule.toString());
        //             });
        //           },
        //         ),
        //         const SmallText(text: 'Free Wi-Fi'),
        //       ],
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(right: Dimensions.width30 * 3),
        //       child: Row(
        //         children: [
        //           Checkbox(
        //             value: cubit.acCheckBoxVaule,
        //             activeColor: AppColors.mainColor,
        //             side: const BorderSide(
        //               color: Colors.white24,
        //               width: 2,
        //             ),
        //             shape: const RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.all(Radius.circular(5.0))),
        //             splashRadius: 20.0,
        //             onChanged: (value) {
        //               setState(() {
        //                 cubit. acCheckBoxVaule = value!;
        //                 log(cubit.acCheckBoxVaule.toString());
        //               });
        //             },
        //           ),
        //           const SmallText(text: 'A/C'),
        //         ],
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }
}
