import 'package:flutter/material.dart';
import 'package:to_do_app/app/app.dart';
import 'package:to_do_app/app/config/configuration.dart';
import 'package:to_do_app/app/provider/app_provider_scope.dart';

void main() async {
  await AppConfiguration.setup();

  // debugPaintSizeEnabled = true;

  runApp(AppProviderScope(child: const App()));
}
