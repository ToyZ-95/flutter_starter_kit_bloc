import 'package:flutter/material.dart';

abstract class IColorsConstants {
  factory IColorsConstants.getInstance() => ColorsConstants();

  Color get whiteColor;
  Color get blackColor;
  Color get transparent;

  Color get introActiveIndicator;
  Color get introIndicator;
  Color get linkBlue;
  Color get disabledColor;
  Color get slateGrey;
  Color get lightWhite;

  Color get successGreen;
  Color get infoYellow;
  Color get errorRed;
}

class ColorsConstants implements IColorsConstants {
  @override
  Color get transparent => Colors.transparent;

  @override
  Color get whiteColor => const Color(0xffffffff);

  @override
  Color get blackColor => const Color(0xff000000);

  @override
  Color get introActiveIndicator => const Color(0xffFDEA5D);

  @override
  Color get introIndicator => const Color(0xffC1C2C5);

  @override
  Color get linkBlue => const Color(0xff138AE1);

  @override
  Color get disabledColor => const Color(0xffCBCBCB);

  @override
  Color get slateGrey => const Color(0xffDBDBDB);

  @override
  Color get lightWhite => const Color(0xfff7f7f7);

  @override
  Color get errorRed => const Color(0xffff3300);

  @override
  Color get infoYellow => const Color(0xffffff66);

  @override
  Color get successGreen => const Color(0xff00ff99);
}
