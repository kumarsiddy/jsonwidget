import 'package:flutter/material.dart';

enum AppColor {
  PRIMARY,
  PRIMARY_DARK,
  ACCENT,
  WHITE,
  SNOW_WHITE,
  TRANSPARENT,
  PRIMARY_TRANSPARENT,
  BLACK,
  GRAY,
  LABEL,
  SHADOW_COLOR,
  RED,
}

extension AppColorExtension on AppColor {
  Color get color {
    switch (this) {
      case AppColor.PRIMARY:
        return Color(0xff2A9EDA);
      case AppColor.PRIMARY_DARK:
        return Color(0xff204866);
      case AppColor.ACCENT:
        return Colors.white;
      case AppColor.WHITE:
        return Colors.white;
      case AppColor.SNOW_WHITE:
        return Color(0xffF7F9FC);
      case AppColor.TRANSPARENT:
        return Colors.transparent;
      case AppColor.PRIMARY_TRANSPARENT:
        return Color(0x8000BE82);
      case AppColor.BLACK:
        return Colors.black;
      case AppColor.RED:
        return Colors.redAccent;
      case AppColor.GRAY:
        return Color(0xff808589);
      case AppColor.SHADOW_COLOR:
        return Color(0xffEBEFF5);
      case AppColor.LABEL:
        return Color(0xff728CA7);
      default:
        return null;
    }
  }
}
