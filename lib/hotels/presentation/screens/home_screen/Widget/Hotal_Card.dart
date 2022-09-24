import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget hotelCard() { return SliverToBoxAdapter(
  child: BlocConsumer<HotelCubit, HotelState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit=HotelCubit.get(context);

    return Container(
    child: ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics (),
      scrollDirection: Axis.vertical,
     separatorBuilder: (context, index) => const SizedBox(height: 16,),
     // itemBuilder: (context, index) => Padding(
     //   padding: const EdgeInsets.only(right: 15,left: 15),
     //   child: Container(
     //     decoration: BoxDecoration(
     //       borderRadius: const BorderRadiusDirectional.all(
     //           Radius.circular(17)),
     //       color: Colors.white.withOpacity(0.1),
     //     ),
     //     height: 140,
     //     child: Row(
     //       children: [
     //         Expanded(
     //             flex: 2,
     //             child: Container(
     //                 height: 150,
     //                 decoration: const BoxDecoration(
     //                   color: Colors.black,
     //                   borderRadius:
     //                   BorderRadiusDirectional.only(
     //                     topStart: Radius.circular(17),
     //                     bottomStart: Radius.circular(17),
     //                   ),
     //                 ),
     //                 child: ClipRRect(
     //                   borderRadius:
     //                   const BorderRadiusDirectional.only(
     //                     topStart: Radius.circular(17),
     //                     bottomStart: Radius.circular(17),
     //                   ),
     //                   // child: Image(
     //                   //   // image: NetworkImage(
     //                   //   //     "http://api.mahmoudtaha.com/images/${
     //                   //   //         cubit.allHotelsData!.hotelData![index]
     //                   //   //             .hotelImages![index].image!
     //                   //   //     }"),
     //                   //   image: NetworkImage(
     //                   //       "http://api.mahmoudtaha.com/images/${
     //                   //           cubit.imageList![index]
     //                   //       }"),
     //                   //   fit: BoxFit.cover,
     //                   // ),
     //             child: (cubit.imageList[index].image!.isNotEmpty)?
     //              Image(
     //             image: AssetImage("assets/images/no.png"),
     //             fit: BoxFit.cover,
     //             )     :  Image(
     //             image: NetworkImage("http://api.mahmoudtaha.com/images/${ cubit.imageList[index]}"),
     //             fit: BoxFit.cover,
     //             )
     //                 ))),
     //         const SizedBox(
     //           width: 5,
     //         ),
     //         Expanded(
     //           flex: 2,
     //           child: Column(
     //             children: [
     //               const SizedBox(
     //                 height: 10,
     //               ),
     //               Column(
     //                 children: [
     //                   Text(
     //                     cubit.allHotelsData!.hotelData![index].name!,
     //                     style: const TextStyle(
     //                         fontSize: 16,
     //                         fontWeight: FontWeight.bold,
     //                         color: Colors.white),
     //                   ),
     //                   Text(
     //                     cubit.allHotelsData!.hotelData![index].address!,
     //                     style: const TextStyle(
     //                         fontSize: 14, color: Colors.grey),
     //                   ),
     //                 ],
     //               ),
     //               const Spacer(),
     //               Column(
     //                 children: [
     //                   Row(
     //                     mainAxisAlignment: MainAxisAlignment.start,
     //                     children: const [
     //                       Icon(
     //                         Icons.location_pin,
     //                         color: Colors.teal,
     //                         size: 16,
     //                       ),
     //                       Text(
     //                         '4.0 Km to city',
     //                         style: TextStyle(
     //                             fontSize: 13, color: Colors.grey),
     //                       ),
     //                     ],
     //                   ),
     //                   const SizedBox(
     //                     height: 5,
     //                   ),
     //                   Row(
     //                     children: const [
     //                       Icon(
     //                         Icons.star,
     //                         color: Colors.teal,
     //                         size: 16,
     //                       ),
     //                       Icon(
     //                         Icons.star,
     //                         color: Colors.teal,
     //                         size: 16,
     //                       ),
     //                       Icon(
     //                         Icons.star,
     //                         color: Colors.teal,
     //                         size: 16,
     //                       ),
     //                       Icon(
     //                         Icons.star,
     //                         color: Colors.teal,
     //                         size: 16,
     //                       ),
     //                       Icon(
     //                         Icons.star,
     //                         color: Colors.grey,
     //                         size: 16,
     //                       ),
     //                     ],
     //                   ),
     //                 ],
     //               ),
     //               const SizedBox(
     //                 height: 10,
     //               ),
     //             ],
     //           ),
     //         ),
     //         const SizedBox(
     //           width: 5,
     //         ),
     //         Expanded(
     //           flex: 1,
     //           child: Column(
     //             mainAxisAlignment: MainAxisAlignment.end,
     //
     //             children: [
     //               Padding(
     //                 padding: const EdgeInsets.only(right: 6,bottom: 5),
     //                 child: Row(
     //                   mainAxisAlignment: MainAxisAlignment.end,
     //                   children: [
     //                     Text(
     //                       "\$${ cubit.allHotelsData!.hotelData![index].price}",
     //                       style: const TextStyle(
     //                           fontWeight: FontWeight.bold,
     //                           fontSize: 18,
     //                           color: Colors.white),
     //                     ),
     //                   ],
     //                 ),
     //               ),
     //               const Text(
     //                 '/per night',
     //                 style:
     //                 TextStyle(fontSize: 14, color: Colors.grey),
     //               ),
     //               const SizedBox(
     //                 height: 10,
     //               )
     //             ],
     //           ),
     //         ),
     //         const SizedBox(
     //           width: 5,
     //         ),
     //       ],
     //     ),
     //   ),
     // ),
     itemBuilder: (context, index) => Padding(
       padding: const EdgeInsets.only(right: 15,left: 15),
       child: InkWell(

         onTap: (){
           cubit.getDetails(index);
           // Navigator.push(context, DetailsScreen());
           Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(),));
         },
         child: Container(
           decoration: BoxDecoration(
             borderRadius: const BorderRadiusDirectional.all(
                 Radius.circular(17)),
             color: Colors.white.withOpacity(0.1),
           ),
           height: 140,
           child: Row(
             children: [
               Expanded(
                   flex: 2,
                   child: Container(
                       height: 150,
                       decoration: const BoxDecoration(
                         // color: Colors.black,

                         borderRadius:
                         BorderRadiusDirectional.only(
                           topStart: Radius.circular(17),
                           bottomStart: Radius.circular(17),
                         ),
                       ),
                       child: ClipRRect(
                         borderRadius:
                         const BorderRadiusDirectional.only(
                           topStart: Radius.circular(17),
                           bottomStart: Radius.circular(17),
                         ),
                         // child: Image(
                         //   // image: NetworkImage(
                         //   //     "http://api.mahmoudtaha.com/images/${
                         //   //         cubit.allHotelsData!.hotelData![index]
                         //   //             .hotelImages![index].image!
                         //   //     }"),
                         //   image: NetworkImage(
                         //       "http://api.mahmoudtaha.com/images/${
                         //           cubit.imageList![index]
                         //       }"),
                         //   fit: BoxFit.cover,
                         // ),
                   child: (cubit.allHotelsData!.hotelData![index].hotelImages!.isEmpty)?
                    Image(
                   image: AssetImage("assets/images/no.png"),
                   fit: BoxFit.cover,
                   )     :  Image(
                   image: NetworkImage("http://api.mahmoudtaha.com/images/${ cubit.allHotelsData!.hotelData![index].hotelImages![0].image!}"),
                   fit: BoxFit.cover,
                   )
                       ))),
               const SizedBox(
                 width: 5,
               ),
               Expanded(
                 flex: 2,
                 child: Column(
                   children: [
                     const SizedBox(
                       height: 10,
                     ),
                     Column(
                       children: [
                         Text(
                           cubit.allHotelsData!.hotelData![index].name!,
                           style: const TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.bold,
                               color: Colors.white),
                         ),
                         Text(
                           cubit.allHotelsData!.hotelData![index].address!,
                           style: const TextStyle(
                               fontSize: 14, color: Colors.grey),
                         ),
                       ],
                     ),
                     const Spacer(),
                     Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: const [
                             Icon(
                               Icons.location_pin,
                               color: Colors.teal,
                               size: 16,
                             ),
                             Text(
                               '4.0 Km to city',
                               style: TextStyle(
                                   fontSize: 13, color: Colors.grey),
                             ),
                           ],
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         Row(
                           children: const [
                             Icon(
                               Icons.star,
                               color: Colors.teal,
                               size: 16,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.teal,
                               size: 16,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.teal,
                               size: 16,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.teal,
                               size: 16,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.grey,
                               size: 16,
                             ),
                           ],
                         ),
                       ],
                     ),
                     const SizedBox(
                       height: 10,
                     ),
                   ],
                 ),
               ),
               const SizedBox(
                 width: 5,
               ),
               Expanded(
                 flex: 1,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,

                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 6,bottom: 5),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Text(
                             "\$${ cubit.allHotelsData!.hotelData![index].price}",
                             style: const TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18,
                                 color: Colors.white),
                           ),
                         ],
                       ),
                     ),
                     const Text(
                       '/per night',
                       style:
                       TextStyle(fontSize: 14, color: Colors.grey),
                     ),
                     const SizedBox(
                       height: 10,
                     )
                   ],
                 ),
               ),
               const SizedBox(
                 width: 5,
               ),
             ],
           ),
         ),
       ),
     ),

        itemCount:cubit.allHotelsData!.hotelData!.length
        ,
    ),
  );
  },
),
);}