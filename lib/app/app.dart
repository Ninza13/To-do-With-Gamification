import 'package:flutter/material.dart';
import 'package:to_do_app/app/config/injectable.dart';
import 'package:to_do_app/app/router/router.dart';
import 'package:to_do_app/common/strings.dart';
import 'package:to_do_app/ui/theme/style_manager.dart';
import 'package:to_do_app/ui/theme/theme_data.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    StyleManager.setDefaultStyle(
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.test,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
      ),
      routerConfig: locator<AppRouter>().config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
