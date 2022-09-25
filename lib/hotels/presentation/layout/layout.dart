import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  static const routeName = 'LayoutScreen';

  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HotelCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.custom,
            color: Colors.white,
            backgroundColor: Colors.teal,
            // gradient: LinearGradient(colors: [Colors.grey, Colors.teal]),
            // curveSize: 10,
            // height: Dimensions.height30 * 2,
            activeColor: Colors.white70,
            items: [
              TabItem(
                  title: 'Explor',
                  activeIcon: Icon(
                    Icons.search,
                    size: Dimensions.iconSize30 * 2,
                  ),
                  icon: Icons.search),
              TabItem(
                  activeIcon: Icon(
                    Icons.history,
                    size: Dimensions.iconSize30 * 2,
                  ),
                  title: 'Booking',
                  icon: Icons.history),
              TabItem(
                  title: 'Profile',
                  activeIcon: Icon(
                    Icons.person_outline,
                    size: Dimensions.iconSize30 * 2,
                  ),
                  icon: Icons.person_outline),
            ],
            initialActiveIndex: 0,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
          ),
          // bottomNavigationBar: BubbleBottomBar(
          //   backgroundColor: Colors.white70,
          //   tilesPadding: const EdgeInsets.all(15.0),
          //   opacity: .2,
          //   onTap: (index) {
          //     cubit.changeNavBar(index);
          //   },
          //   currentIndex: cubit.currentIndex,
          //   items: const <BubbleBottomBarItem>[
          //     BubbleBottomBarItem(
          //       backgroundColor: Colors.grey,
          //       icon: Icon(
          //         Icons.list,
          //         color: Colors.grey,
          //       ),
          //       activeIcon: Icon(
          //         Icons.list,
          //         color: Colors.amber,
          //       ),
          //       title: Text('Test 1'),
          //     ),
          //     BubbleBottomBarItem(
          //       backgroundColor: Colors.grey,
          //       icon: Icon(
          //         Icons.list,
          //         color: Colors.grey,
          //       ),
          //       activeIcon: Icon(
          //         Icons.list,
          //         color: Colors.deepOrange,
          //       ),
          //       title: Text('Test 2'),
          //     ),
          //     BubbleBottomBarItem(
          //       backgroundColor: Colors.grey,
          //       icon: Icon(
          //         Icons.list,
          //         color: Colors.grey,
          //       ),
          //       activeIcon: Icon(
          //         Icons.list,
          //         color: Colors.red,
          //       ),
          //       title: Text('Test 3'),
          //     ),
          //   ],
          // ),
        );
      },
    );
  }
}
