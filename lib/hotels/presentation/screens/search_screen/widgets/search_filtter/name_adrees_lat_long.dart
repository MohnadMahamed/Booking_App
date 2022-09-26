import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:flutter/material.dart';

var hotelNameController = TextEditingController();
var addressController = TextEditingController();
var latitudeController = TextEditingController();
var longitudeController = TextEditingController();

class NameAdressLatAndLonWidget extends StatelessWidget {
  const NameAdressLatAndLonWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                  controller: hotelNameController,
                  labelText: 'Name',
                  type: TextInputType.name),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Expanded(
              child: defaultTextFormFeild(
                  controller: addressController,
                  type: TextInputType.name,
                  labelText: 'Address'),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: defaultTextFormFeild(
                  controller: latitudeController,
                  labelText: 'Latitude',
                  type: TextInputType.number),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Expanded(
              child: defaultTextFormFeild(
                  controller: longitudeController,
                  labelText: 'Longitude',
                  type: TextInputType.number),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
      ],
    );
  }
}
