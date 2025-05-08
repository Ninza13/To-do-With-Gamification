import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as base;
import 'package:to_do_app/app/provider/badge_provider.dart';
import 'package:to_do_app/app/provider/theme_provider.dart';
import 'package:to_do_app/app/provider/todo_provider.dart';

class AppProviderScope extends StatelessWidget {
  const AppProviderScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return base.MultiProvider(
      providers: [
        base.ChangeNotifierProvider(create: (_) => TodoProvider()),
        base.ChangeNotifierProvider(create: (_) => BadgeProvider()),
        base.ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: child,
    );
  }
}
