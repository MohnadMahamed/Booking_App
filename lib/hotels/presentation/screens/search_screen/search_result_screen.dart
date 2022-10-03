import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/empty_list.dart';
import 'package:booking_app/hotels/presentation/components/widgets/hotel_item.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/resources/string_manager.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_filtter_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_map_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultScreen extends StatelessWidget {
  static String routeName = LocaleKeys.search_screen.tr();

  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HotelCubit.get(context);
        return SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   toolbarHeight: 100,
            //   leadingWidth: Dimensions.width20 * 4,
            //   leading: title:
            //    centerTitle: true,
            //   actions: [
            //   ],
            // ),
            //backgroundColor: AppColors.backGroundColor,
            // backgroundColor: AppColors.backGroundColor,
            body: BlocConsumer<HotelCubit, HotelState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10),
                            child: Container(
                              width: Dimensions.width30 * 2,
                              height: Dimensions.width30 * 2,
                              decoration: BoxDecoration(
                                  // color: HotelCubit.get(context).isDark
                                  //     ? Colors.grey[200]
                                  //     : Colors.black87,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, LayoutScreen.routeName);
                                    cubit.getAllHotels(1);

                                    // Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: Dimensions.iconSize30 * 1.2,
                                    color: cubit.isDark
                                        ? Colors.black
                                        : AppColors.mainColor,
                                  )),
                            ),
                          ),
                          SmallHeadLineText(
                            text: 'Explore',
                            size: Dimensions.font20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10),
                            child: Container(
                              width: Dimensions.width30 * 2,
                              height: Dimensions.width30 * 2,
                              decoration: BoxDecoration(
                                  // color: HotelCubit.get(context).isDark
                                  //     ? Colors.grey[200]
                                  //     : Colors.black87,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, SearchMapScreen.routeName);
                                    // Navigator.pop(context);
                                    cubit.getAllHotels(1);
                                  },
                                  icon: Icon(
                                    Icons.location_on_sharp,
                                    size: Dimensions.iconSize30 * 1.2,
                                    color: cubit.isDark
                                        ? Colors.black
                                        : AppColors.mainColor,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.width20),
                      child: Row(
                        children: [
                          Expanded(
                              child: myForm(
                                  TextColor: HotelCubit.get(context).isDark
                                      ? Colors.black
                                      : Colors.white70,
                                  hitTextColor: HotelCubit.get(context).isDark
                                      ? Colors.black
                                      : Colors.white38,
                                  fillColor: HotelCubit.get(context).isDark
                                      ? Colors.transparent
                                      : AppColors.myTFFColor,
                                  colorsBorderSide:
                                      HotelCubit.get(context).isDark
                                          ? Colors.black87
                                          : Colors.black,
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
                                  cubit.searchHotels();
                                },
                                icon: Icon(
                                  Icons.search,
                                  size: Dimensions.iconSize30 * 1.2,
                                  color: Colors.black87,
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.width20),
                      child: myDivider(),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //go to filtter page
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.width20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallHeadLineText(
                              text:
                                  '${cubit.searchHotelList.length} Hotel Found'),
                          InkWell(
                            onTap: () {
                              cubit.getAllFacilities();
                              Navigator.pushNamed(
                                  context, SearchFiltterScreen.routeName);
                            },
                            child: Row(
                              children: [
                                SmallHeadLineText(
                                    text: LocaleKeys.filtter.tr()),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Icon(
                                  Icons.filter_list,
                                  size: Dimensions.iconSize30 * 1.3,
                                  color: AppColors.mainColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    if (state is SearchHotelsSuccessState)
                      cubit.searchHotelList.isEmpty
                          ? const Expanded(
                              child: Center(
                              child: EmptyList(
                                massage: 'No search result',
                              ),
                            ))
                          : Expanded(
                              child: SingleChildScrollView(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: Dimensions.height15,
                                  ),
                                  itemBuilder: (context, index) =>
                                      HotelItemWidget(
                                    onTap: () {
                                      cubit.getAllFacilities();

                                      cubit.getDetails(index);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailsScreen(),
                                          ));
                                    },
                                    hotelImage: (cubit.searchHotelList[index]
                                            .hotelImages!.isEmpty)
                                        ? const Image(
                                            image: AssetImage(
                                                "assets/images/no.png"),
                                            fit: BoxFit.cover,
                                          )
                                        : Image(
                                            image: NetworkImage(
                                                "http://api.mahmoudtaha.com/images/${cubit.searchHotelList[index].hotelImages![0].image!}"),
                                            fit: BoxFit.cover,
                                          ),
                                    hotelName:
                                        cubit.searchHotelList[index].name!,
                                    hotelAddress:
                                        cubit.searchHotelList[index].address!,
                                    hotelPrice:
                                        '\$${cubit.searchHotelList[index].price!}',
                                    hotelRate: cubit
                                        .allHotelsData!.hotelData![index].rate!,
                                  ),
                                  itemCount: cubit.searchHotelList.length,
                                ),
                              ),
                            ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
