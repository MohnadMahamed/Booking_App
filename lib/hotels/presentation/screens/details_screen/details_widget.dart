import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/widgets/details/background_details_page.dart';
import '../../components/widgets/details/hotel_details.dart';
import '../../components/widgets/details/photohotel.dart';
import '../../components/widgets/details/ratinghotel.dart';
import '../../components/widgets/details/reviews_of_hotel.dart';
import '../component/my_buttom.dart';

class DetailsWidget extends StatefulWidget {

  const DetailsWidget({
    Key? key,

  }) : super(key: key);

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late ScrollController scrollController;
  bool showTitle = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= 645) {
        setState(() {
          showTitle = true;
        });
      } else {
        setState(() {
          showTitle = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit=HotelCubit.get(context);
    return SafeArea(
      child: BlocConsumer<HotelCubit, HotelState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
        body: CustomScrollView(controller: scrollController, slivers: [
          SliverAppBar(
            elevation: 0,
            actionsIconTheme: const IconThemeData(size: 25),
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height,
            pinned: true,
            toolbarHeight: 150,
            leadingWidth: 100,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 55),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white60),
                child: IconButton(
                    onPressed: () {
                      cubit.getAllHotels(1);
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    )),
              ),
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 53),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.black87),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.teal,
                        size: 20,
                      )),
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: showTitle == false
                  ? BackGroundDetailsPage()
                  : const SizedBox(
                      height: 0,
                    ),
              title: showTitle == true
                  ? Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      )),
                      // child: Image.asset(
                      //   'assets/images/1.jpg',
                      //   height: double.infinity,
                      //   width: double.infinity,
                      //   fit: BoxFit.cover,
                      // ),
                      child: Image(
                        image: NetworkImage("http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0XFF1A1A1A),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HotelViewDetails(),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Summary',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          // 'Featuring a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum...',
                          cubit.hotelDetails!.description!,
                          style: const TextStyle(
                              wordSpacing: 5,
                              fontSize: 14,
                              color: Colors.white60,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RatingHotel(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Photo',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  child: const Text(
                                    'View all',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {},
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.teal,
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        PhotoOfHotel(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Reviews',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  child: const Text(
                                    'View all',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {},
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.teal,
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ReviewsOfHotel(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 280,
                          // child: Image.asset(
                          //   'assets/images/onboard.png',
                          //   fit: BoxFit.fill,
                          // ),
                          child: Image(
                            image: NetworkImage("http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                       const SizedBox(
                          height: 20,
                        ),
                        MyButton(
                          onClick: () {},
                          text: 'Book now',
                          background: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
  },
),
    );
  }
}
