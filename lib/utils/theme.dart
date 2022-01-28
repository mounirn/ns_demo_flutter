import 'package:flutter/material.dart';
import 'package:ns_demo/serializables/app_client.dart';
import 'package:ns_demo/utils/color_utils.dart';

// https://codelabs.developers.google.com/codelabs/mdc-103-flutter#3
const kShrinePink50 = Color(0xFFFEEAE6);
const kShrinePink100 = Color(0xFFFEDBD0);
const kShrinePink300 = Color(0xFFFBB8AC);
const kShrinePink400 = Color(0xFFEAA4A4);

const kShrineBrown900 = Color(0xFF442B2D);

const kShrineErrorRed = Color(0xFFC5032B);

const kShrineSurfaceWhite = Color(0xFFFFFBFA);
const kShrineBackgroundWhite = Colors.white;


ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    // TODO: Add the text themes (103)
    // TODO: Add the icon themes (103)
    // TODO: Decorate the inputs (103)
  );
  
}

/// Build the theme based on selected client
ThemeData buildAppThemeForClient(NsAppClientDetails? client) {
  final ThemeData base = ThemeData.light();
  if (client!= null) {
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primaryVariant: NsColorUtils.getBorderColor(client),
        primary: NsColorUtils.getHeaderColor(client),
        onPrimary: NsColorUtils.getTextColor(client),
        secondary: NsColorUtils.getFooterColor(client),
        error: NsColorUtils.getTitleColor(client),
       
      ),
      // TODO: Add the text themes (103)
      // TODO: Add the icon themes (103)
      // TODO: Decorate the inputs (103)
    );
  }
  else {
    return buildAppTheme();
  }
}

final nsAppThemeYellow = ThemeData(
  primarySwatch: Colors.yellow,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);
