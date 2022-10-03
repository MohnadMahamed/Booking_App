import 'package:booking_app/core/network/location_helper.dart';
import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/hotel_map_item.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_result_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchMapScreen extends StatefulWidget {
  static String routeName = LocaleKeys.search_map_screen.tr();

  const SearchMapScreen({super.key});

  @override
  State<SearchMapScreen> createState() => _SearchMapScreenState();
}

class _SearchMapScreenState extends State<SearchMapScreen> {
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

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: LatLng(position!.latitude, position!.longitude), zoom: 12),
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

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition),
    );
  }

  Future<void> _goToLocation(double lat, double lon) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 15, tilt: 50.0, bearing: 45.0, target: LatLng(lat, lon))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);

          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.backGroundColor,
              appBar: AppBar(
                toolbarHeight: 70,
                backgroundColor: AppColors.backGroundColor,
                leadingWidth: Dimensions.width20 * 4,
                leading: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                  ),
                  child: Container(
                    width: Dimensions.width30 * 2,
                    height: Dimensions.width30 * 2,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SearchResultScreen.routeName);
                          // Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: Dimensions.iconSize30 * 1.2,
                          color: Colors.white,
                        )),
                  ),
                ),
                title: StaticColorText(
                  text: 'Explore',
                  size: Dimensions.font20,
                ),
                centerTitle: true,
              ),
              body: Stack(children: [
                (position != null)
                    ? buildMap()
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height15),
                    child: Row(
                      children: [
                        Expanded(
                            child: myForm(
                                TextColor: Colors.white38,
                                hitTextColor: Colors.white38,
                                fillColor:
                                    const Color.fromARGB(255, 27, 22, 22),
                                colorsBorderSide: Colors.transparent,
                                controller: cubit.searchResultController,
                                hintText: LocaleKeys.london.tr())),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        Container(
                          width: Dimensions.width30 * 2,
                          height: Dimensions.width30 * 2,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(50.0)),
                          child: IconButton(
                              onPressed: () {
                                // cubit.searchHotels();
                              },
                              icon: Icon(
                                Icons.search,
                                size: Dimensions.iconSize30 * 1.3,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),

                //list view
                state is GetAllHotelsSuccessState
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height20 + 10,
                              horizontal: Dimensions.width20),
                          child: SizedBox(
                            height: Dimensions.hotelMapItemHeight +
                                Dimensions.height10,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) => SizedBox(
                                width: Dimensions.width15,
                              ),
                              itemBuilder: (context, index) => SizedBox(
                                height: Dimensions.hotelMapItemHeight,
                                width: Dimensions.hotelMapItemWidth,
                                child: HotelMapItemWidget(
                                  color: HotelCubit.get(context).isDark
                                      ? Colors.grey[200]
                                      : Colors.black87,
                                  onTap: () {
                                    _goToLocation(
                                        double.parse(cubit.allHotelsData!
                                            .hotelData![index].latitude!),
                                        double.parse(cubit.allHotelsData!
                                            .hotelData![index].longitude!));
                                  },
                                  hotelImage: (cubit
                                          .allHotelsData!
                                          .hotelData![index]
                                          .hotelImages!
                                          .isEmpty)
                                      ? const Image(
                                          image: AssetImage(
                                              "assets/images/no.png"),
                                          fit: BoxFit.cover,
                                        )
                                      : Image(
                                          image: NetworkImage(
                                              "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![0].image!}"),
                                          fit: BoxFit.cover,
                                        ),
                                  hotelName: cubit
                                      .allHotelsData!.hotelData![index].name!,
                                  hotelAddress: cubit.allHotelsData!
                                      .hotelData![index].address!,
                                  hotelPrice:
                                      '\$${cubit.allHotelsData!.hotelData![index].price!}',
                                  hotelRate: cubit
                                      .allHotelsData!.hotelData![index].rate!,
                                ),
                              ),
                              itemCount: cubit.allHotelsData!.hotelData!.length,
                            ),
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ]),
              floatingActionButton: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0,
                    Dimensions.hotelMapItemHeight + Dimensions.height30 * 2),
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: _goToMyCurrentLocation,
                  child: const Icon(
                    Icons.place,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
