import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget defaultTextFormFeild({
  required TextEditingController? controller,
  IconData? suffix = Icons.manage_search,
  required String? labelText,
  TextInputType? type,
  void Function(String)? onTap,
  void Function(String)? onChanged,
  String? Function(String?)? valdide,
}) =>
    SizedBox(
      height: Dimensions.height30 * 2,
      // width: Dimensions.width30 * 7,
      child: TextFormField(
        style: TextStyle(fontSize: Dimensions.font26, color: Colors.white),
        controller: controller,
        keyboardType: type,
        onChanged: onChanged,
        validator: valdide,
        // onSubmitted: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[800],
          label: SmallText(
            text: '$labelText',
            color: Colors.white,
          ),
          suffixIcon: Icon(suffix, color: Colors.white),
          // labelStyle: TextStyle(
          //   color: Colors.red,
          //   fontSize: Dimensions.font30,
          // ),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(width: 0.0, color: Colors.transparent),
          ),
        ),
      ),
    );

Widget editTextFormFeild({
  required TextEditingController? controller,
  required String? hintText,
  TextInputType? type,
  void Function(String)? onTap,
  void Function(String)? onChanged,
  String? Function(String?)? valdide,
}) =>
    SizedBox(
      height: Dimensions.height30 * 2,
      // width: Dimensions.width30 * 9,
      child: TextFormField(
        style: TextStyle(fontSize: Dimensions.font26, color: Colors.white),
        controller: controller,
        keyboardType: type,
        onChanged: onChanged,
        validator: valdide,
        // onSubmitted: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.white, fontSize: Dimensions.font20),
          filled: true,
          fillColor: Colors.transparent.withOpacity(.2),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(width: 0.0, color: Colors.transparent),
          ),
        ),
      ),
    );

void navigateeeTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
Widget myDivider() => Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.font20),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[900],
      ),
    );

final emptySvg = SvgPicture.asset(
  'assets/empty.svg',
  semanticsLabel: 'No tasks to show',
  cacheColorFilter: true,
  theme:
      const SvgTheme(currentColor: Colors.black, fontSize: 10.0, xHeight: 50.0),
);
