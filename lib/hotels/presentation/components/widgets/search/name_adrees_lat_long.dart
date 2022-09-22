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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            defaultTextFormFeild(
                controller: hotelNameController,
                labelText: 'Name',
                type: TextInputType.name),
            defaultTextFormFeild(
                controller: addressController,
                type: TextInputType.name,
                labelText: 'Address'),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            defaultTextFormFeild(
                controller: latitudeController,
                labelText: 'Latitude',
                type: TextInputType.number),
            defaultTextFormFeild(
                controller: longitudeController,
                labelText: 'Longitude',
                type: TextInputType.number),
          ],
        ),
      ],
    );
  }
}
