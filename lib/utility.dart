import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Utility {
  // Strings
  static String appTitle = "ChatEve";
  static String welcomeText = "Welcome to $appTitle";
  static String signInAccountText =
      "Sign in or create an \naccount to get started";

  // Colors
  static Color primaryColor = const Color(0XFF03BF9C);
  static Color secondaryColor = const Color(0XFFF7F0FC);
  static Color accentColor = const Color(0XFFEAFFFB);
  static Color lightGreyColor = const Color(0XFFF4F4F4);
  static Color lightGreyTextColor = const Color(0XFF979797);
  static Color darkGreyColor = const Color(0XFFDADADA);
  static Color greyColor = const Color(0XFFEAEAEA);
  static Color blackColor = const Color(0XFF292929);
  static Color darkGreenColor = const Color(0XFF00796B);

  // TextStyle
  static TextStyle buttonPrimaryWhite = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal));
  static TextStyle navUnselected = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: blackColor, fontSize: 12, fontWeight: FontWeight.normal));
  static TextStyle primaryText12 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: blackColor, fontSize: 12, fontWeight: FontWeight.normal));
  static TextStyle primaryText24 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: blackColor, fontSize: 24, fontWeight: FontWeight.normal));
  static TextStyle miniGreyText = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: lightGreyTextColor, fontSize: 12, fontWeight: FontWeight.normal));
  static TextStyle miniGreyText10 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: lightGreyTextColor, fontSize: 10, fontWeight: FontWeight.normal));
  static TextStyle primaryTextWhite = GoogleFonts.manrope(
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal));
  static TextStyle primaryTextBlack = GoogleFonts.manrope(
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal));
  static TextStyle primaryTitleWhite = GoogleFonts.manrope(
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500));
  static TextStyle primaryTitleBlack = GoogleFonts.manrope(
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500));

  static customTextForm(
    labelText,
    hint,
    validatorForm,
    controller, {
    int maxLine = 1,
    Widget? icon,
    bool obscureValue = false,
    TextInputType labelType = TextInputType.text,
  }) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextFormField(
          controller: controller,
          validator: validatorForm,
          keyboardType: labelType,
          obscureText: obscureValue,
          maxLines: maxLine,
          decoration: InputDecoration(
            fillColor: Colors.grey,
            focusColor: Colors.grey,
            border: InputBorder.none,
            suffix: obscureValue ? icon : null,
            hintText: hint,
          ),
        ),
      ),
    );
  }

  static fullSizedButton(BuildContext context, onPress, text, color,
      {width = null}) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      onPressed: onPress,
      color: color,
      height: 48,
      minWidth: width ?? getWidth(context) / 0.7,
      child: Text(text, style: buttonPrimaryWhite),
    );
  }

  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
