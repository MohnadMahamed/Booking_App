import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

Widget defaultTextFormFeild({
  required TextEditingController? controller,
  IconData? suffix = Icons.manage_search,
  required String? labelText,
  TextInputType? type,
  void Function(String)? onTap,
  void Function(String)? onChanged,
  Color? filColor = Colors.grey,
  Color? textColor = Colors.white,
  Color? iconColor = Colors.white,
  String? Function(String?)? valdide,
}) =>
    SizedBox(
      height: Dimensions.height30 * 2,
      // width: Dimensions.width30 * 7,
      child: TextFormField(
        style: TextStyle(
            fontSize: Dimensions.font26,
            color: textColor == Colors.white ? Colors.white : textColor),
        controller: controller,
        keyboardType: type,
        onChanged: onChanged,
        validator: valdide,
        // onSubmitted: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: filColor == Colors.grey ? Colors.grey : filColor,
          label: SmallHeadLineText(
            text: '$labelText',
            color: textColor,
          ),
          suffixIcon: Icon(suffix, color: iconColor),
          // labelStyle: TextStyle(
          //   color: Colors.red,
          //   fontSize: Dimensions.font30,
          // ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
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
  Color? textColor = Colors.white,
}) =>
    SizedBox(
      height: Dimensions.height30 * 1.7,
      // width: Dimensions.width30 * 9,
      child: TextFormField(
        style: GoogleFonts.cairo(
            fontSize: Dimensions.font20,
            fontWeight: FontWeight.w700,
            color: textColor == Colors.white ? Colors.white : textColor),
        controller: controller,
        keyboardType: type,
        onChanged: onChanged,
        validator: valdide,
        // onSubmitted: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.cairo(
              color: textColor,
              fontSize: Dimensions.font16,
              fontWeight: FontWeight.w600),
          filled: true,
          fillColor: Colors.transparent.withOpacity(.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
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

Widget myForm({
  required TextEditingController? controller,
  IconButton? suffixIcon,
  Icon? prefixIcon,
  required String? hintText,
  TextInputType? type,
  void Function()? onTap,
  void Function(String)? onChanged,
  String? validation,
  required Color? colorsBorderSide,
  required Color? fillColor,
  required Color? hitTextColor,
  required Color? TextColor,
  String? Function(String?)? validate,
  double maxLenght = 10,
  bool isPassword = false,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height10 / 1.5,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius30),
        ),
        height: Dimensions.height30 * 1.7,
        child: TextFormField(
          onTap: onTap,
          obscureText: isPassword,
          style: GoogleFonts.cairo(
              fontSize: Dimensions.font16,
              fontWeight: FontWeight.w700,
              color: TextColor),
          controller: controller,
          keyboardType: type,
          onChanged: onChanged,
          validator: (T) => validate!(T),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                left: Dimensions.width20, top: Dimensions.height20),

            hintText: hintText,
            hintStyle: GoogleFonts.cairo(
                fontWeight: FontWeight.w500,
                color: hitTextColor,
                fontSize: Dimensions.font16),
            filled: true,
            fillColor: fillColor,
            suffixIcon: suffixIcon,
            // suffix: Icon(prefixIcon,color: Colors.white38,),
            prefixIcon: prefixIcon,
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                borderSide:
                    const BorderSide(width: 2.0, color: AppColors.mainColor)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              borderSide: BorderSide(color: colorsBorderSide!, width: 2.0
                  // color: HotelCubit.get(context).isDark ? Colors.black:
                  ),
            ),
          ),
        ),
      ),
    );

Widget searchButton({
  required String text,
  void Function()? onTap,
  required Color? color,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height10, vertical: Dimensions.width20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50.0),
          ),
          height: Dimensions.height30 * 2.0,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: Dimensions.width20),
            child: Row(children: [
              Icon(
                Icons.search,
                color: AppColors.mainColor,
                size: Dimensions.iconSize24 * 1.5,
              ),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              SmallText(
                size: Dimensions.font20,
                text: text,
              )
            ]),
          ),
        ),
      ),
    );

void updateBookingAlert({context, func, String? not}) {
  final AlertDialog alart = AlertDialog(
    scrollable: true,
    title: const StaticColorText(
      text: 'Update to : ',
      color: Colors.black,
    ),
    content: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            not == 'upcome'
                ? const SizedBox(
                    width: 0.0,
                  )
                : Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.mainColor),
                      child: InkWell(
                          onTap: () {
                            func;
                            Navigator.pop(context);

                            showToast(
                                text: 'Updated Succesfuly',
                                state: ToastStates.SUCCESS);
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Icon(
                                    Icons.next_plan,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  StaticColorText(
                                    text: 'Upcoming',
                                    size: Dimensions.font12,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
            const SizedBox(
              width: 10.0,
            ),
            not == 'cancel'
                ? const SizedBox(
                    width: 0.0,
                  )
                : Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red),
                      child: InkWell(
                          onTap: () {
                            func;
                            Navigator.pop(context);
                            showToast(
                                text: 'Updated Succesfuly',
                                state: ToastStates.ERROR);
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  StaticColorText(
                                    text: 'Canceled',
                                    size: Dimensions.font12,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
            const SizedBox(
              width: 10.0,
            ),
            not == 'complet'
                ? const SizedBox(
                    width: 0.0,
                  )
                : Expanded(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              func;
                              showToast(
                                  text: ' Updated Succesfuly',
                                  state: ToastStates.SUCCESS);
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Icon(
                                      Icons.cloud_done,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    StaticColorText(
                                      text: 'Completed',
                                      size: Dimensions.font12,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    ),
  );
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return alart;
      });
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

void showToast({
  String text = '',
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
