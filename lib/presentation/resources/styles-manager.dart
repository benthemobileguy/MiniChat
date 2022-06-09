import 'package:flutter/material.dart';
import 'package:mini_chat/presentation/resources/font-manager.dart';


TextStyle _getTextStyle(
    double fontSize, String fontFamily, double lineHeight, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      height: lineHeight,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s14,  double lineHeight, Color color}) {
  return _getTextStyle(
      fontSize,
      FontConstants.fontFamilyNunito,
      lineHeight,
      FontWeightManager.regular, color);
}
TextStyle getGradientStyle(
    {double fontSize = FontSize.s19, double lineHeight, Color color}) {
  return _getTextStyle(
      fontSize,
      FontConstants.fontFamilyUbuntu,
      lineHeight,
      FontWeightManager.bold, color);
}
TextStyle getGradientStyle2(
    {double fontSize = FontSize.s14,  double lineHeight,Color color}) {
  return _getTextStyle(
      fontSize,
      FontConstants.fontFamilyUbuntu,
      lineHeight,
      FontWeightManager.bold, color);
}
// light text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, double lineHeight, Color color}) {
  return _getTextStyle(
      fontSize,
      FontConstants.fontFamilyNunito,
      lineHeight,
      FontWeightManager.light,
      color);
}
// bold text style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, double lineHeight, Color color}) {
  return _getTextStyle(
      fontSize,
      FontConstants.fontFamilyNunito,
      lineHeight,
      FontWeightManager.bold,
      color);
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, double lineHeight,Color color}) {
  return _getTextStyle(
      fontSize,
      FontConstants.fontFamilyNunito,
      lineHeight,
      FontWeightManager.semiBold, color);
}


// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, Color color, double lineHeight,}) {
  return _getTextStyle(
      fontSize,
      FontConstants.fontFamilyNunito,
      lineHeight,
      FontWeightManager.medium, color);
}