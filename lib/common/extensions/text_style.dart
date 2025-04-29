import 'package:flutter/material.dart';

extension TextFontsize on TextStyle {
  TextStyle withScaler(TextScaler scaler) {
    return copyWith(
      fontSize: fontSize != null ? scaler.scale(fontSize!) : null,
    );
  }
}

extension TextWeight on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
}

extension TextColor on TextStyle {
  TextStyle? get white => copyWith(color: Colors.white);
  TextStyle? get black => copyWith(color: Colors.black);
  TextStyle? withColor(Color? color) => copyWith(color: color);
}
