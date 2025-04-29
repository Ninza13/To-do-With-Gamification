import 'package:flutter/widgets.dart';

abstract class StyleManager {
  static void setDefaultStyle({required TextStyle style}) {
    _baseTextStyle = style;
  }

  static TextStyle get base => _baseTextStyle;

  static TextStyle _baseTextStyle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get s10 => _baseTextStyle.copyWith(fontSize: 10);
  static TextStyle get s12 => _baseTextStyle.copyWith(fontSize: 12);
  static TextStyle get s14 => _baseTextStyle.copyWith(fontSize: 14);
  static TextStyle get s16 => _baseTextStyle.copyWith(fontSize: 16);
  static TextStyle get s20 => _baseTextStyle.copyWith(fontSize: 20);
  static TextStyle get s24 => _baseTextStyle.copyWith(fontSize: 24);
}
