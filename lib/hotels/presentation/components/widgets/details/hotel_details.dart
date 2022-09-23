import 'package:flutter/material.dart';

class HotelViewDetails extends StatefulWidget {
  const HotelViewDetails({Key? key}) : super(key: key);

  @override
  State<HotelViewDetails> createState() => _HotelViewDetailsState();
}

class _HotelViewDetailsState extends State<HotelViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Grand Royal Hotel',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              children: const [
                Text(
                  'Wembley, Londen',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.add_location,
                  color: Colors.teal,
                  size: 20,
                ),
                Text(
                  '2.0km to city',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: const [
            Text(
              "\$ 180",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "/per night",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
