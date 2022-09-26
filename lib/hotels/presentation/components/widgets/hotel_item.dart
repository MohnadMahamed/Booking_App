import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';

class HotelItemWidget extends StatelessWidget {
  final void Function() onTap;
  final Widget hotelImage;
  final String hotelName;
  final String hotelAddress;
  final String hotelPrice;

  const HotelItemWidget(
      {super.key,
      required this.onTap,
      required this.hotelImage,
      required this.hotelName,
      required this.hotelAddress,
      required this.hotelPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(
                Radius.circular(Dimensions.radius15)),
            color: Colors.white.withOpacity(0.1),
          ),
          height: 150,
          width: double.infinity,

          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(17),
                        bottomStart: Radius.circular(17),
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(17),
                          bottomStart: Radius.circular(17),
                        ),
                        child: hotelImage)),
              ),
              SizedBox(
                width:10,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.width15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          size: Dimensions.font12 * 1.7,
                          text: hotelName,
                        ),
                        SmallText(
                          size: Dimensions.font20,
                          text: hotelAddress,
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.teal,
                                  size: Dimensions.iconSize24,
                                ),
                                SizedBox(
                                  width: Dimensions.width10 / 2.5,
                                ),
                                SmallText(
                                  text: '40.0 Km to city',
                                  size: Dimensions.font10*1.4,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width10 / 1.5),
                                child: Row(
                                  children: [
                                    Wrap(
                                      children: List.generate(
                                        4,
                                        (index) => Icon(
                                          Icons.star_sharp,
                                          color: AppColors.mainColor,
                                          size: Dimensions.iconSize16*1.5,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_half,
                                      color: Colors.teal,
                                      size: Dimensions.iconSize16*1.5,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Dimensions.width10),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SmallText(
                                color: Colors.white,
                                text: hotelPrice,
                              ),
                              SmallText(
                                text: 'per night',
                                size: Dimensions.font12 * 1.7,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

   // Padding(
                  //   padding: const EdgeInsets.only(right: 15, left: 15),
                  //   child: InkWell(
                  //     onTap: () {
                  //       cubit.getDetails(index);
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const DetailsScreen(),
                  //           ));
                  //     },
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: const BorderRadiusDirectional.all(
                  //             Radius.circular(17)),
                  //         color: Colors.white.withOpacity(0.1),
                  //       ),
                  //       height: 140,
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //               height: 150,
                  //               decoration: const BoxDecoration(
                  //                 // color: Colors.black,

                  //                 borderRadius: BorderRadiusDirectional.only(
                  //                   topStart: Radius.circular(17),
                  //                   bottomStart: Radius.circular(17),
                  //                 ),
                  //               ),
                  //               child: ClipRRect(
                  //                   borderRadius:
                  //                       const BorderRadiusDirectional.only(
                  //                     topStart: Radius.circular(17),
                  //                     bottomStart: Radius.circular(17),
                  //                   ),
                  // child: (cubit
                  //         .allHotelsData!
                  //         .hotelData![index]
                  //         .hotelImages!
                  //         .isEmpty)
                  //     ? const Image(
                  //         image: AssetImage(
                  //             "assets/images/no.png"),
                  //         fit: BoxFit.cover,
                  //       )
                  //     : Image(
                  //         image: NetworkImage(
                  //             "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![0].image!}"),
                  //         fit: BoxFit.cover,
                  //       ))),
                  //           SizedBox(
                  //             width: Dimensions.width20,
                  //           ),
                  //           Expanded(
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 SizedBox(
                  //                   height: Dimensions.width15,
                  //                 ),
                  //                 Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: [
                  //                     BigText(
                  //                       size: Dimensions.font12 * 1.7,
                  // text: cubit.allHotelsData!
                  //     .hotelData![index].name!,
                  //                     ),
                  //                     SmallText(
                  //                       size: Dimensions.font20,
                  //                       text: cubit.allHotelsData!
                  //                           .hotelData![index].address!,
                  //                     )
                  //                   ],
                  //                 ),
                  //                 const Spacer(),
                  //                 Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.start,
                  //                           children: [
                  //                             Icon(
                  //                               Icons.location_pin,
                  //                               color: Colors.teal,
                  //                               size: Dimensions.iconSize24,
                  //                             ),
                  //                             SizedBox(
                  //                               width: Dimensions.width10 / 2.5,
                  //                             ),
                  //                             SmallText(
                  //                               text: '40.0 Km to city',
                  //                               size: Dimensions.font16,
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         const SizedBox(
                  //                           height: 5,
                  //                         ),
                  //                         Padding(
                  //                           padding: EdgeInsets.only(
                  //                               left: Dimensions.width10 / 1.5),
                  //                           child: Wrap(
                  //                             children: List.generate(
                  //                               5,
                  //                               (index) => Icon(
                  //                                 Icons.star_sharp,
                  //                                 color: AppColors.mainColor,
                  //                                 size: Dimensions.iconSize24,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     Padding(
                  //                       padding: EdgeInsets.only(
                  //                           right: Dimensions.width10),
                  //                       child: Column(
                  //                         // mainAxisAlignment: MainAxisAlignment.end,
                  //                         children: [
                  //                           SmallText(
                  //                             color: Colors.white,
                  //                             text:
                  //                                 "\$${cubit.allHotelsData!.hotelData![index].price}",
                  //                           ),
                  //                           SmallText(
                  //                             text: '/per night',
                  //                             size: Dimensions.font20,
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 SizedBox(
                  //                   height: Dimensions.height15,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
               

// Widget hotelItem(
//         {required void Function() onTap,
//         required Widget hotelImage,
//         required String hotelName,
//         required String hotelAddress,
//         required String hotelPrice}) =>
//     Padding(
//       padding: const EdgeInsets.only(right: 15, left: 15),
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius:
//                 const BorderRadiusDirectional.all(Radius.circular(17)),
//             color: Colors.white.withOpacity(0.1),
//           ),
//           height: 140,
//           child: Row(
//             children: [
//               Container(
//                   height: 150,
//                   decoration: const BoxDecoration(
//                     // color: Colors.black,

//                     borderRadius: BorderRadiusDirectional.only(
//                       topStart: Radius.circular(17),
//                       bottomStart: Radius.circular(17),
//                     ),
//                   ),
//                   child: ClipRRect(
//                       borderRadius: const BorderRadiusDirectional.only(
//                         topStart: Radius.circular(17),
//                         bottomStart: Radius.circular(17),
//                       ),
//                       child: hotelImage)),
//               SizedBox(
//                 width: Dimensions.width20,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: Dimensions.width15,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BigText(
//                           size: Dimensions.font12 * 1.7,
//                           text: hotelName,
//                         ),
//                         SmallText(
//                           size: Dimensions.font20,
//                           text: hotelAddress,
//                         )
//                       ],
//                     ),
//                     const Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   Icons.location_pin,
//                                   color: Colors.teal,
//                                   size: Dimensions.iconSize24,
//                                 ),
//                                 SizedBox(
//                                   width: Dimensions.width10 / 2.5,
//                                 ),
//                                 SmallText(
//                                   text: '40.0 Km to city',
//                                   size: Dimensions.font16,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                   left: Dimensions.width10 / 1.5),
//                               child: Wrap(
//                                 children: List.generate(
//                                   5,
//                                   (index) => Icon(
//                                     Icons.star_sharp,
//                                     color: AppColors.mainColor,
//                                     size: Dimensions.iconSize24,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(right: Dimensions.width10),
//                           child: Column(
//                             // mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               SmallText(
//                                 color: Colors.white,
//                                 text: hotelPrice,
//                               ),
//                               SmallText(
//                                 text: '/per night',
//                                 size: Dimensions.font20,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: Dimensions.height15,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

