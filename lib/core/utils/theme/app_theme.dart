import 'package:chat_app/core/utils/theme/app_fonts.dart';
import 'package:chat_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.white,
      primaryColor: AppColor.darkGreen,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.darkGreen,
          brightness: Brightness.light),
      textTheme: TextTheme(
        headlineLarge: AppTextStyle.heading2.copyWith(color: Colors.black),
        headlineMedium: AppTextStyle.heading3.copyWith(color: Colors.black),
        headlineSmall: AppTextStyle.heading4.copyWith(color: Colors.black),
        labelLarge: AppTextStyle.heading2.copyWith(color: Colors.black,fontWeight: FontWeightManager.bold),
        labelMedium: AppTextStyle.heading4.copyWith(color: Colors.black,fontWeight: FontWeightManager.bold),
        titleLarge: AppTextStyle.heading2.copyWith(color: Colors.black,fontSize:FontSize.s22 ),
        titleMedium: AppTextStyle.heading3.copyWith(color: Colors.black,fontWeight: FontWeightManager.medium),
        titleSmall: AppTextStyle.heading4.copyWith(color: Colors.black,fontSize: FontSize.s14,fontWeight: FontWeightManager.medium),
        displayLarge: AppTextStyle.heading1.copyWith(color: Colors.black,fontWeight: FontWeightManager.medium),
        displayMedium:AppTextStyle.heading4.copyWith(color: Colors.black,fontSize: FontSize.s14,) ,
        displaySmall: AppTextStyle.subHeading1.copyWith(color: Colors.black),
        bodyMedium: AppTextStyle.subHeading2.copyWith(color: Colors.black),
        bodySmall: AppTextStyle.paragraph1.copyWith(color: Colors.black,fontSize: FontSize.s12),


      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.darkGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)))),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      backgroundColor: AppColor.white,
      selectedItemColor: AppColor.darkGreen,
      unselectedItemColor: AppColor.grey,
      selectedLabelStyle: AppTextStyle.grey16BookCaros,
      unselectedLabelStyle: AppTextStyle.grey16BookCaros.copyWith(color: AppColor.darkGreen),
    ),

  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.softBlack,
    primaryColor: AppColor.darkGreen,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.darkGreen,
        brightness: Brightness.dark
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyle.heading2.copyWith(color: Colors.white),
      headlineMedium: AppTextStyle.heading3.copyWith(color: Colors.white),
      headlineSmall: AppTextStyle.heading4.copyWith(color: Colors.white),
      labelLarge: AppTextStyle.heading2.copyWith(color: Colors.white,fontWeight: FontWeightManager.bold),
      labelMedium: AppTextStyle.heading4.copyWith(color: Colors.white,fontWeight: FontWeightManager.bold),
      titleLarge: AppTextStyle.heading2.copyWith(color: Colors.white,fontSize:FontSize.s22 ),
      titleMedium: AppTextStyle.heading3.copyWith(color: Colors.white,fontWeight: FontWeightManager.medium),
      titleSmall: AppTextStyle.heading4.copyWith(color: Colors.white,fontSize: FontSize.s14,fontWeight: FontWeightManager.medium),
      displayLarge: AppTextStyle.heading1.copyWith(color: Colors.white,fontWeight: FontWeightManager.medium),
      displayMedium:AppTextStyle.heading4.copyWith(color: Colors.white,fontSize: FontSize.s14,) ,
      displaySmall: AppTextStyle.subHeading1.copyWith(color: Colors.white),
      bodyMedium: AppTextStyle.subHeading2.copyWith(color: Colors.white),
      bodySmall: AppTextStyle.paragraph1.copyWith(color: Colors.white,fontSize: FontSize.s12),


    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.darkGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      backgroundColor: AppColor.white,
      selectedItemColor: AppColor.darkGreen,
      unselectedItemColor: AppColor.grey,
      selectedLabelStyle: AppTextStyle.grey16BookCaros,
      unselectedLabelStyle: AppTextStyle.grey16BookCaros.copyWith(color: AppColor.darkGreen),
    ),
  );
}
