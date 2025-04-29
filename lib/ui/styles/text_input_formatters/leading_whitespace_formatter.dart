import 'package:flutter/services.dart';

class LeadingWhitespaceFormatter extends TextInputFormatter {
  const LeadingWhitespaceFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
