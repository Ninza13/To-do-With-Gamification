import 'package:flutter/widgets.dart';

abstract class BaseProvider extends ChangeNotifier {
  BaseProvider();

  Widget wrapChild(Widget child) => child;
}
