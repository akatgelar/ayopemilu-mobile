import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle styleHeader({
  Color color = ThemeColor.black,
  double fontSize = 22,
  FontWeight fontWeight = FontWeight.w500,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle styleHeaderWhite({
  Color color = ThemeColor.white,
  double fontSize = 22,
  FontWeight fontWeight = FontWeight.w500,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle styleTitle({
  Color color = ThemeColor.primary,
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.w500,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle styleSubtitle({
  Color color = ThemeColor.primary,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w500,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle styleTextNormalBlack({
  Color color = ThemeColor.black,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle styleTextNormalGrey({
  Color color = ThemeColor.grey,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle styleTextNormalPrimary({
  Color color = ThemeColor.primary,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w500,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle styleTextNormalBlue({
  Color color = ThemeColor.blue,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle styleFormLabel({
  Color color = ThemeColor.black,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

InputDecoration styleFormInputSearch(textSearch) {
  return InputDecoration(
    filled: true,
    fillColor: ThemeColor.greylight,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: ThemeColor.primary,
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: ThemeColor.grey,
        width: 1.0,
      ),
    ),
    hintStyle: styleTextNormalGrey(),
    hintText: textSearch,
    suffixIcon: const Icon(CupertinoIcons.search),
  );
}

InputDecoration styleFormInputLogin(textHint) {
  return InputDecoration(
    filled: true,
    fillColor: ThemeColor.textBackground,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        color: ThemeColor.primary,
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        color: ThemeColor.textBackground,
        width: 1.0,
      ),
    ),
    hintStyle: const TextStyle(color: ThemeColor.grey),
    hintText: textHint,
  );
}

InputDecoration styleFormInput(textHint) {
  return InputDecoration(
    filled: true,
    fillColor: ThemeColor.greylight,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: ThemeColor.grey,
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: ThemeColor.greyMedium,
        width: 1.0,
      ),
    ),
    hintStyle: styleTextNormalGrey(),
    hintText: textHint,
  );
}

ButtonStyle styleFormButton(context, height) {
  return TextButton.styleFrom(
    backgroundColor: ThemeColor.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    minimumSize: Size(
      MediaQuery.of(context).size.width,
      height.toDouble(),
    ),
  );
}

ButtonStyle styleFormButtonGreen(context, height) {
  return TextButton.styleFrom(
    backgroundColor: ThemeColor.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    minimumSize: Size(
      MediaQuery.of(context).size.width,
      height.toDouble(),
    ),
  );
}

ButtonStyle styleFormButtonOrange(context, height) {
  return TextButton.styleFrom(
    backgroundColor: ThemeColor.yellow,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    minimumSize: Size(
      MediaQuery.of(context).size.width,
      height.toDouble(),
    ),
  );
}

ButtonStyle styleFormButtonRed(context, height) {
  return TextButton.styleFrom(
    backgroundColor: ThemeColor.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    minimumSize: Size(
      MediaQuery.of(context).size.width,
      height.toDouble(),
    ),
  );
}

Container badgeRed(textLabel) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: ThemeColor.red,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: ThemeColor.red,
    ),
    padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
    child: Text(
      textLabel,
      style: const TextStyle(color: ThemeColor.white, fontSize: 11),
    ),
  );
}

Container badgeYellow(textLabel) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: ThemeColor.yellow,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: ThemeColor.yellow,
    ),
    padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
    child: Text(
      textLabel,
      style: const TextStyle(color: ThemeColor.white, fontSize: 11),
    ),
  );
}

Container badgeGreen(textLabel) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: ThemeColor.green,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: ThemeColor.green,
    ),
    padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
    child: Text(
      textLabel,
      style: const TextStyle(color: ThemeColor.white, fontSize: 11),
    ),
  );
}
