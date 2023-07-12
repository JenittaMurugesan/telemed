import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

class Utility {
  // Strings
  static String appTitle = "ChatEve";
  static String welcomeText = "Welcome to $appTitle";
  static String signInAccountText =
      "Sign in or create an \naccount to get started";

  // Routes
  static String appointmentDetails = "/appointments-details";

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
  static Color timeLineColor = const Color(0XFF740AC7);

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
  static TextStyle primaryTextGreen12 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: primaryColor , fontSize: 12, fontWeight: FontWeight.normal));
  static TextStyle primaryTextGreen16 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: primaryColor , fontSize: 16, fontWeight: FontWeight.normal));
  static TextStyle primaryText16 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal));
  static TextStyle primaryText14 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal));
  static TextStyle primaryText18 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal));
  static TextStyle primaryText24 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: blackColor, fontSize: 24, fontWeight: FontWeight.normal));
  static TextStyle primaryText36 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: blackColor, fontSize: 36, fontWeight: FontWeight.normal));
  static TextStyle primaryText20 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: blackColor, fontSize: 20, fontWeight: FontWeight.normal));
  static TextStyle miniGreyText = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: lightGreyTextColor, fontSize: 12, fontWeight: FontWeight.normal));
  static TextStyle greyText10 = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: lightGreyTextColor, fontSize: 10, fontWeight: FontWeight.normal));
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
    double? width,
    Widget? icon,
    bool obscureValue = false,
    bool readOnly = false,
    GestureTapCallback? onTap,
    TextInputType labelType = TextInputType.text,
  }) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          controller: controller,
          validator: validatorForm,
          keyboardType: labelType,
          obscureText: obscureValue,
          maxLines: maxLine,
          decoration: InputDecoration(
            fillColor: Colors.grey,
            focusColor: Colors.grey,
            border: InputBorder.none,
            suffix: icon,
            hintText: hint,
          ),
        ),
      ),
    );
  }

  static fullSizedButton(BuildContext context, onPress, text, color,
      {double? width, TextStyle? style}) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: onPress,
      color: color,
      minWidth: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Text(text, style: style ?? buttonPrimaryWhite),
      ),
    );
  }

  static fullSizedWhiteButton(BuildContext context, onPress, text, color,
      {double? width, TextStyle? style}) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
      onPressed: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Text(text, style: style ?? primaryText16),
      ),
    );
  }

  static fullSizedButtonIcon(BuildContext context, VoidCallback onPress, text, color, assetName,
      {double? width, TextStyle? style, Color? assetColor}) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: onPress,
      color: color,
      minWidth: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          children: [
            Text(text, style: style ?? buttonPrimaryWhite),
            const SizedBox(width: 4),
            SvgPicture.asset(
              assetName,
              colorFilter: ColorFilter.mode(assetColor ?? Colors.black, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }

  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
