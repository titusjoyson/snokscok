import 'package:flutter/material.dart';

class Pallet {
  // #E1D4D2
  static final Color silk = const Color.fromRGBO(225, 212, 210, 1);
  // #BDB3A8
  static final Color silkDark = const Color.fromRGBO(189, 179, 168, 1);
  // #2D2727
  static final Color sasBlack = const Color.fromRGBO(45, 39, 39, 1);
  // #534858
  static final Color brownDark = const Color.fromRGBO(83, 72, 88, 1);
  // 237,97,81
  static final Color shabbyRed = const Color.fromRGBO(237, 97, 81, 1);
}

class FontSize {
  static final double button = 14.00;
  static final double caption = 12.0;
  static final double bodyOne = 14.0;
  static final double bodyTwo = 14.0;
  static final double subHeader = 16.0;
  static final double title = 20.0;
  static final double headline = 24.0;
  static final double displayOne = 34.0;
  static final double displayTwo = 45.0;
  static final double displayTree = 56.0;
  static final double displayFour = 112.0;
}

class TextStyles {
  static final TextStyle header = TextStyle(
      fontSize: FontSize.headline,
      fontWeight: FontWeight.w500,
      color: Pallet.sasBlack);
  static final TextStyle caption = TextStyle(
      fontSize: FontSize.caption,
      fontWeight: FontWeight.w500,
      color: Pallet.sasBlack);
  static final TextStyle subHeader = TextStyle(
      fontSize: FontSize.subHeader,
      fontWeight: FontWeight.w500,
      color: Pallet.sasBlack);
  static final TextStyle body = TextStyle(
      fontSize: FontSize.bodyOne,
      fontWeight: FontWeight.w500,
      color: Pallet.sasBlack);
  static final TextStyle bodyTwo = TextStyle(
    fontSize: FontSize.bodyOne,
    color: Pallet.sasBlack,
  );
  static final TextStyle button = TextStyle(
      fontSize: FontSize.button,
      fontWeight: FontWeight.w500,
      color: Pallet.sasBlack);
  static final TextStyle camButton = TextStyle(
      fontSize: FontSize.button,
      fontWeight: FontWeight.w500,
      color: Colors.white);
}

class BackgroundStyles {
  static final LinearGradient lgSilk = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [Pallet.silk, Pallet.silkDark]);
}
