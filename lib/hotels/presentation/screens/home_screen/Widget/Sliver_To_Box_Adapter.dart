import 'package:flutter/material.dart';

class Sliver_To_Box_Adapter extends StatelessWidget {
  const Sliver_To_Box_Adapter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Container(
          child: Text(
            'Other hotel',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
