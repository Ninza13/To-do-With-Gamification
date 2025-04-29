import 'package:auto_route/auto_route.dart';

final class InstantRoute extends CustomRoute {
  InstantRoute({
    required super.page,
    super.children,
    super.initial,
    super.path,
    super.guards,
    super.keepHistory,
  }) : super(
         // ignore: deprecated_member_use
         durationInMilliseconds: 0,
         // ignore: deprecated_member_use
         reverseDurationInMilliseconds: 0,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return child;
         },
       );
}
