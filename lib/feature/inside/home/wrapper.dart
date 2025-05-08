import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeWrapperScreen extends StatelessWidget {
  const HomeWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
