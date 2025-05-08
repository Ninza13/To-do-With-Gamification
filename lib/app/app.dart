import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/app/config/injectable.dart';
import 'package:to_do_app/app/provider/theme_provider.dart';
import 'package:to_do_app/app/router/router.dart';
import 'package:to_do_app/common/strings.dart';
import 'package:to_do_app/ui/theme/style_manager.dart';
import 'package:to_do_app/ui/theme/theme_data.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    StyleManager.setDefaultStyle(
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    if (themeProvider.themeMode == ThemeMode.system) {
      themeProvider.notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.test,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
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
