import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_fonts.dart';

class AppTextStyle {
  AppTextStyle._();
  static const TextStyle heading1 = TextStyle(
    fontFamily: FontNames.carosFont,
    fontSize: FontSize.s40,
    fontWeight: FontWeightManager.extraBold,
    color: AppColor.white,
  );
  static const TextStyle heading2 = TextStyle(
      fontFamily: FontNames.carosFont,
      fontSize: FontSize.s20,
      fontWeight: FontWeightManager.medium);
  static const TextStyle heading3 = TextStyle(
      fontFamily: FontNames.carosFont,
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.bold
  );
  static const TextStyle heading4 = TextStyle(
      fontFamily: FontNames.carosFont,
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.medium
  );
  static const TextStyle subHeading3 = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.book
  );
  static const TextStyle subHeading2 = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.book,
      color: AppColor.grey
  );
  static const TextStyle subHeading1 = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s12,
      fontWeight: FontWeightManager.book,
    color: AppColor.grey
  );
  static const TextStyle paragraph1 = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.medium);
  static const TextStyle paragraph2 = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.medium,
      color: AppColor.darkGreen
  );
  static const TextStyle paragraph3 = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s12,
      fontWeight: FontWeightManager.medium,
      color: AppColor.white
  );
  static const TextStyle white14BookCaros = TextStyle(
      fontFamily: FontNames.carosFont,
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.book);
  static const TextStyle grey10BookCircular = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s10,
      fontWeight: FontWeightManager.book,
    color: AppColor.grey
  );
  static const TextStyle grey12BookCircular = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s12,
      fontWeight: FontWeightManager.book,
    color: AppColor.grey
  );
  static const TextStyle grey14BookCircular = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.book,
    color: AppColor.grey
  );
  static const TextStyle lightGreen14MediumCircular = TextStyle(
      fontFamily: FontNames.circularStdFont,
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.medium,
      color: AppColor.lightGreen
  );

  static const TextStyle grey16MediumCaros = TextStyle(
      fontFamily: FontNames.carosFont,
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.medium,
    color: AppColor.grey
  );
  static const TextStyle grey16BoldCaros = TextStyle(
      fontFamily: FontNames.carosFont,
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.medium,
    color: AppColor.grey
  );
  static const TextStyle grey16BookCaros = TextStyle(
      fontFamily: FontNames.carosFont,
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.book,
    color: AppColor.grey
  );
  static const TextStyle green14BoldCaros = TextStyle(
      fontFamily: FontNames.carosFont,
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.bold,
    color: AppColor.darkGreen
  );







}
