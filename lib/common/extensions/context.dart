import 'package:flutter/widgets.dart';

extension ContextExtensions on BuildContext {
  bool get isKeyboardShowing => MediaQuery.viewInsetsOf(this).bottom != 0;
}
