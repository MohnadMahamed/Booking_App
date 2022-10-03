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
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            child: Wrap(
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
                            width: Dimensions.width20 * 4,
                            height: Dimensions.height30 * 2.4,
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
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
