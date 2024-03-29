import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textStyleLarge = textStyleWithGoogleFont(fontSize: 18);

final textStyleMedium = textStyleWithGoogleFont(fontSize: 16);

final textStyleBold =
    textStyleWithGoogleFont(fontWeight: FontWeight.bold, fontSize: 14);

final textStylePlain = textStyleWithGoogleFont(fontSize: 14);

final textStyleGreySmall =
    textStyleWithGoogleFont(fontSize: 10, color: Colors.grey);

final textStyleGreyPlain =
    textStyleWithGoogleFont(fontSize: 14, color: Colors.grey);

final textStyleRedPlain =
    textStyleWithGoogleFont(fontSize: 14, color: Colors.white10);

TextStyle textStyleWithGoogleFont(
    {double fontSize = 14, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.mPlusRounded1c(
      textStyle:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color));
}
