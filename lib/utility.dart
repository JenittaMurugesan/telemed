
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Utility {

  // Strings
  static String appTitle = "ChatEve";
  static String welcomeText = "Welcome to $appTitle";
  static String signInAccountText = "Sign in or create an \naccount to get started";

  // Colors
  static Color primaryColor = const Color(0XFF03BF9C);
  static Color secondaryColor = const Color(0XFFF7F0FC);
  static Color accentColor = const Color(0XFFEAFFFB);
  static Color lightGreyColor = const Color(0XFFF4F4F4);
  static Color darkGreyColor = const Color(0XFFDADADA);
  static Color greyColor = const Color(0XFFEAEAEA);

  // TextStyle
  static TextStyle buttonPrimaryWhite = GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal));
  static TextStyle primaryTextWhite = GoogleFonts.manrope(textStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal));
  static TextStyle primaryTitleWhite = GoogleFonts.manrope(textStyle: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500));

  static customTextForm(labelType,labelText,obscureValue,icon,hint,validatorForm, controller, {int maxLine = 1}){
    return Container(height:65,width:320,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.1),
        border: Border.all(color: Colors.grey.withOpacity(.2),
            width: 2),
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
            label: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(labelText),
            ),
            labelStyle: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
            suffix:obscureValue?icon:null,
            hintText: hint,


          ),
        ),
      ),
    );
  }

  static fullSizedButton(BuildContext context, onPress, text, color, {width = null}) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
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
