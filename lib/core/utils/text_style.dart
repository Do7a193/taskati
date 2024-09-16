import 'package:flutter/material.dart';
import 'package:taskati/core/utils/appcolors.dart';

TextStyle getTiitleTextStyle(
    {double? fontSize, Color? colorFree, FontWeight? fontwiegt}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 18,
    fontWeight: fontwiegt ?? FontWeight.w700,
    color: colorFree ?? Appcolors.Black,
  );
}

 TextStyle getBodyTextStyle(
    {double? fontSize, Color? colorFree, FontWeight? fontwiegt}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 16,
    color: colorFree ?? Appcolors.Black,
  );
}

TextStyle getSmallTextStyle(
    {double? fontSize, Color? colorFree, FontWeight? fontwiegt}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 14,
    color: colorFree ?? Appcolors.Romady,
  );
}
