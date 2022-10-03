import 'package:booking_app/core/network/location_helper.dart';
import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/hotel_item.dart';
import 'package:booking_app/hotels/presentation/components/widgets/hotel_map_item.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailMapWidget extends StatefulWidget {
  // static String routeName = LocaleKeys.search_map_screen.tr();

  const DetailMapWidget({
    super.key,
  });

  @override
  State<DetailMapWidget> createState() => _DetailMapWidgetState();
}

class _DetailMapWidgetState extends State<DetailMapWidget> {
  // FloatingSearchBarController controller = FloatingSearchBarController();
  static Position? position;
  String? _mapStyle;

  Completer<GoogleMapController> _mapController = Completer();
  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
      target: LatLng(position!.latitude, position!.longitude));
  Future<void> getMyCurrentlocation() async {
    position = await LocationHelper.getCurrrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentlocation();
    rootBundle.loadString('assets/dark_map_style.json').then((string) {
      _mapStyle = string;
    });
  }

  Widget buildMap({required double lat, required double lon}) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(lat, lon), zoom: 12),
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) {
        _mapController.complete(controller);
        controller.setMapStyle(_mapStyle);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);

          return SizedBox(
            height: Dimensions.height30 * 10,
            width: double.infinity,
            child: (position != null)
                ? buildMap(
                    lat: double.parse(cubit.hotelDetails!.latitude!),
                    lon: double.parse(cubit.hotelDetails!.longitude!))
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
          );
        });
  }
}
