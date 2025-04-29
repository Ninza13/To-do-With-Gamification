import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final class FadeRoute extends CustomRoute {
  FadeRoute({
    required super.page,
    super.children,
    super.initial,
    super.path,
    super.guards,
    super.keepHistory,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
