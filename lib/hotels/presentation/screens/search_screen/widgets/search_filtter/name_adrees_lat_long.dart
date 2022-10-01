import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameAdressLatAndLonWidget extends StatelessWidget {
  const NameAdressLatAndLonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: defaultTextFormFeild(
                    controller: cubit.hotelNameController,
                    labelText: 'Name',
                    type: TextInputType.name,
                    filColor: cubit.isDark ? Colors.grey[200] : Colors.black87,
                    textColor: cubit.isDark ? Colors.black : Colors.white,
                    iconColor: cubit.isDark ? Colors.black38 : Colors.grey,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Expanded(
                  child: defaultTextFormFeild(
                    controller: cubit.addressController,
                    type: TextInputType.name,
                    labelText: 'Address',
                    filColor: cubit.isDark ? Colors.grey[200] : Colors.black87,
                    textColor: cubit.isDark ? Colors.black : Colors.white,
                    iconColor: cubit.isDark ? Colors.black38 : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: defaultTextFormFeild(
                    controller: cubit.latitudeController,
                    labelText: 'Latitude',
                    type: TextInputType.number,
                    filColor: cubit.isDark ? Colors.grey[200] : Colors.black87,
                    textColor: cubit.isDark ? Colors.black : Colors.white,
                    iconColor: cubit.isDark ? Colors.black38 : Colors.grey,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Expanded(
                  child: defaultTextFormFeild(
                    controller: cubit.longitudeController,
                    labelText: 'Longitude',
                    type: TextInputType.number,
                    filColor: cubit.isDark ? Colors.grey[200] : Colors.black87,
                    textColor: cubit.isDark ? Colors.black : Colors.white,
                    iconColor: cubit.isDark ? Colors.black38 : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
          ],
        );
      },
    );
  }
}
