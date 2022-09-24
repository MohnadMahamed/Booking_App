import 'package:flutter/material.dart';

class SliverAdapter extends StatelessWidget {
  const SliverAdapter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: Text(
          'Other hotel',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
