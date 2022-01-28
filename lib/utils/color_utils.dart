import 'dart:ui';

import '../serializables/app_object.dart';

class NsColorUtils {
  static const int headerDefault = 0xFF000000;
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color red = Color.fromARGB(255, 255, 0, 0);
  static const Color blue = Color.fromARGB(255, 0, 0, 255);

  static final RegExp hexExp = RegExp(
    r'^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$',
    caseSensitive: false,
  );

  /// Return the header color of an object
  static Color getHeaderColor(NsAppObject? item) {
    if (item == null){
      return blue;
    }
    if (item.colors == null){
      return blue;
    }
    if (item.colors?.headerColor == null){
      return blue;
    }
    int color = hexStringToHexInt(item.colors?.headerColor as String);
    return Color(color);
  }

  
  /// Return the borders color of an object
  static Color getBorderColor(NsAppObject? item) {
    if (item == null){
      return blue;
    }
    if (item.colors == null){
      return blue;
    }
    if (item.colors?.borderColor == null){
      return blue;
    }
    int color = hexStringToHexInt(item.colors?.borderColor as String);
    return Color(color);
  }

  /// Return the header background color of an object
  static Color getHeaderBackgroundColor(NsAppObject? item) {
    if (item == null){
      return white;
    }
    if (item.colors == null){
      return white;
    }
    if (item.colors?.headerColor == null){
      return white;
    }
    int color = hexStringToHexInt(item.colors?.headerBKColor as String);
    return Color(color);
  }

/// Return the body color of an object
  static Color getTextColor(NsAppObject? item) {
    if (item == null){
      return black;
    }
    if (item.colors == null){
      return black;
    }
    if (item.colors?.color == null){
      return black;
    }
    int color = hexStringToHexInt(item.colors?.color as String);
    return Color(color);
  }

  /// Return the text/body background color of an object
  static Color getTextBackgroundColor(NsAppObject? item) {
    if (item == null){
      return white;
    }
    if (item.colors == null){
      return white;
    }
    if (item.colors?.bkColor == null){
      return white;
    }
    int color = hexStringToHexInt(item.colors?.bkColor as String);
    return Color(color);
  }


  static Color getColor(NsAppObject item) {
    if (item.colors == null){
      return black;
    }
    if (item.colors?.color == null){
      return black;
    }
    int color = hexStringToHexInt(item.colors?.color as String);
    return Color(color);
  }

  static Color getFooterColor(NsAppObject? item) {
    if (item == null) {
      return white;
    }
    if (item.colors == null){
      return white;
    }
    if (item.colors?.footerColor == null){
      return white;
    }
    int color = hexStringToHexInt(item.colors?.footerColor as String);
    return Color(color);
  }

  static Color getFooterBackgroundColor(NsAppObject? item) {
    if (item == null) {
      return black;
    }
    if (item.colors == null){
      return black;
    }
    if (item.colors?.footerBKColor == null){
      return black;
    }
    int color = hexStringToHexInt(item.colors?.footerBKColor as String);
    return Color(color);
  }
  static Color getTitleColor(NsAppObject item) {
    if (item.colors == null){
      return red;
    }
    if (item.colors?.titleColor == null){
      return red;
    }
    int color = hexStringToHexInt(item.colors?.titleColor as String);
    return Color(color);
  }

  /// parse a string in the format '#rrggbb' or '#aarrggbb' 
  /// the string has to be of length 7 or 9 
  /// first char must be #
  static int hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff' + hex : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }
  // https://stackoverflow.com/questions/50381968/flutter-dart-convert-hex-color-string-to-color/50382196
}