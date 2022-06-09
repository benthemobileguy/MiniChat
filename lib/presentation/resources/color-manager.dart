import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#8135F9");
  static Color textColor = HexColor.fromHex("#282A3A");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color textGrey = HexColor.fromHex("#4A4C5A");
  static Color backgroundColor = HexColor.fromHex("#F6F7FB");
  static Color textFormFieldColor = HexColor.fromHex("#F3F4F8");
  static Color grey = HexColor.fromHex("#6C6D79");
  static Color grey2 = HexColor.fromHex("#8E8F99");
  static Color borderColor = HexColor.fromHex("#D1D2D8");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color subtleGrey = HexColor.fromHex("#010202");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black= HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}