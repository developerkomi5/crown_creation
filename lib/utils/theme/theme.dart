import 'package:crowncreation/utils/theme/custom_themes/appbar_theme.dart';
import 'package:crowncreation/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:crowncreation/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:crowncreation/utils/theme/custom_themes/chip_theme.dart';
import 'package:crowncreation/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:crowncreation/utils/theme/custom_themes/outlined_botton_theme.dart';
import 'package:crowncreation/utils/theme/custom_themes/text_field_theme.dart';
import 'package:crowncreation/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class KAppTheme {
  //adding underscore means it is private sign these contructor is private
  KAppTheme._();

  //light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color(0xFFf9dc76),
    chipTheme: KChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: KAppBarTheme.lightAppBarTheme,
    checkboxTheme: KCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: KBottomSheetTheme.lightBottomSheetTheme,
    textTheme: KTextTheme.lightTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.lightInputDecorationTheme,
  );

  //dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFf9dc76),
    scaffoldBackgroundColor: const Color(0xFF000000),
    textTheme: KTextTheme.darkTextTheme,
    chipTheme: KChipTheme.darkChipTheme,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    checkboxTheme: KCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: KBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.darkInputDecorationTheme,
  );
}
