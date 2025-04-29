import 'package:flutter/material.dart';
import 'package:to_do_app/app/config/injectable.dart';
import 'package:to_do_app/app/provider/app_provider_scope.dart';

import 'app/app.dart';
import 'app/config/configuration.dart';

void main() async {
  await AppConfiguration.setup();

  // debugPaintSizeEnabled = true;

  runApp(AppProviderScope(child: const App()));
}
