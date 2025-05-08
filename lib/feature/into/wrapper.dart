import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/ui/theme/theme_colors.dart';

@RoutePage()
final class AuthWrapperScreen extends StatelessWidget {
  const AuthWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: ThemeColors.of(context).primary,
      ),
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: const AutoRouter(),
        ),
      ),
    );
  }
}
