import 'dart:io';

import 'package:flutter/material.dart';
import 'constant.dart' as constant;

ThemeData lightTheme() {
  final ThemeData themeData = ThemeData.light();
  TextTheme lightTextTheme(TextTheme themeData) {
    return themeData.copyWith(
      // ? Bold 17
      headline1: themeData.headline1!.copyWith(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      // ? Regular 17
      headline2: themeData.headline2!.copyWith(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      // ? semi-bold 17
      headline3: themeData.headline3!.copyWith(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      // ? Regular 14
      headline4: themeData.headline4!.copyWith(
        fontFamily: 'Nunito',
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      // ? Bold 14
      headline5: themeData.headline5!.copyWith(
          fontFamily: 'Nunito',
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          color: Colors.white),
      // ? semi-bold 16
      headline6: themeData.headline6!.copyWith(
          fontFamily: 'Nunito',
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Colors.white),
      // ? Regular 10
      subtitle1: themeData.subtitle1!.copyWith(
          fontFamily: 'Nunito',
          fontSize: 12.0,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      // ? Bold 10
      subtitle2: themeData.subtitle1!.copyWith(
          fontFamily: 'Nunito',
          fontSize: 12.0,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700),
      // // ? semi-bold 14
      // bodyText1: themeData.headline6!.copyWith(
      //     fontFamily: 'Nunito',
      //     fontSize: 14.0,
      //     color: Colors.white,
      //     fontStyle: FontStyle.normal,
      //     fontWeight: FontWeight.w600),
      // // ? Regular 14
      // bodyText2: themeData.headline6!.copyWith(
      //     fontFamily: 'Nunito',
      //     fontSize: 14.0,
      //     color: Colors.white,
      //     fontStyle: FontStyle.normal,
      //     fontWeight: FontWeight.w400),
    );
  }

  return themeData.copyWith(
      textTheme: lightTextTheme(themeData.textTheme),
      scaffoldBackgroundColor: Color(constant.darkerPrimaryColor),
      accentColor: Color(constant.secondaryColor),
      primaryColorDark: Color(constant.secondaryColor),
      dividerColor: Colors.white.withOpacity(0.5),
      colorScheme: themeData.colorScheme
          .copyWith(secondary: Color(constant.primaryColor)),
      appBarTheme: AppBarTheme(
          centerTitle: Platform.isIOS,
          iconTheme: IconThemeData(color: Colors.white),
          color: Color(constant.primaryColor),
          brightness: Brightness.dark),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      textSelectionTheme: themeData.textSelectionTheme.copyWith(
          selectionColor: Color(constant.secondaryColor),
          cursorColor: Color(constant.secondaryColor),
          selectionHandleColor: Colors.white),
      inputDecorationTheme: themeData.inputDecorationTheme
          .copyWith(filled: true, fillColor: Colors.white));
}
