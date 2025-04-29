// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:to_do_app/app/models/todo.dart' as _i14;
import 'package:to_do_app/feature/inside/badges/badge_screen.dart' as _i1;
import 'package:to_do_app/feature/inside/home/home_screen.dart' as _i2;
import 'package:to_do_app/feature/inside/profile/profile_screen.dart' as _i7;
import 'package:to_do_app/feature/inside/settings/settings_screen.dart' as _i8;
import 'package:to_do_app/feature/inside/shop/shop_screen.dart' as _i9;
import 'package:to_do_app/feature/inside/task_creatation/task_createtion_screen.dart'
    as _i11;
import 'package:to_do_app/feature/inside/wrapper.dart' as _i3;
import 'package:to_do_app/feature/into/onboarding/onboarding_screen.dart'
    as _i5;
import 'package:to_do_app/feature/into/onboarding/onboarding_screen_one.dart'
    as _i4;
import 'package:to_do_app/feature/into/onboarding/onboarding_screen_two.dart'
    as _i6;
import 'package:to_do_app/feature/into/splash/splash_screen.dart' as _i10;

/// generated route for
/// [_i1.BadgeScreen]
class BadgeRoute extends _i12.PageRouteInfo<void> {
  const BadgeRoute({List<_i12.PageRouteInfo>? children})
    : super(BadgeRoute.name, initialChildren: children);

  static const String name = 'BadgeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.BadgeScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.MainWrapperScreen]
class MainWrapperRoute extends _i12.PageRouteInfo<void> {
  const MainWrapperRoute({List<_i12.PageRouteInfo>? children})
    : super(MainWrapperRoute.name, initialChildren: children);

  static const String name = 'MainWrapperRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainWrapperScreen();
    },
  );
}

/// generated route for
/// [_i4.OnboardingOneScreen]
class OnboardingOneRoute extends _i12.PageRouteInfo<void> {
  const OnboardingOneRoute({List<_i12.PageRouteInfo>? children})
    : super(OnboardingOneRoute.name, initialChildren: children);

  static const String name = 'OnboardingOneRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingOneScreen();
    },
  );
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingRoute extends _i12.PageRouteInfo<void> {
  const OnboardingRoute({List<_i12.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i6.OnboardingTwoScreen]
class OnboardingTwoRoute extends _i12.PageRouteInfo<void> {
  const OnboardingTwoRoute({List<_i12.PageRouteInfo>? children})
    : super(OnboardingTwoRoute.name, initialChildren: children);

  static const String name = 'OnboardingTwoRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardingTwoScreen();
    },
  );
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i8.SettingsScreen]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute({List<_i12.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i9.ShopScreen]
class ShopRoute extends _i12.PageRouteInfo<void> {
  const ShopRoute({List<_i12.PageRouteInfo>? children})
    : super(ShopRoute.name, initialChildren: children);

  static const String name = 'ShopRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.ShopScreen();
    },
  );
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.SplashScreen();
    },
  );
}

/// generated route for
/// [_i11.TaskCreatetionScreen]
class TaskCreatetionRoute extends _i12.PageRouteInfo<TaskCreatetionRouteArgs> {
  TaskCreatetionRoute({
    _i13.Key? key,
    _i14.Todo? todo,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         TaskCreatetionRoute.name,
         args: TaskCreatetionRouteArgs(key: key, todo: todo),
         initialChildren: children,
       );

  static const String name = 'TaskCreatetionRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TaskCreatetionRouteArgs>(
        orElse: () => const TaskCreatetionRouteArgs(),
      );
      return _i11.TaskCreatetionScreen(key: args.key, todo: args.todo);
    },
  );
}

class TaskCreatetionRouteArgs {
  const TaskCreatetionRouteArgs({this.key, this.todo});

  final _i13.Key? key;

  final _i14.Todo? todo;

  @override
  String toString() {
    return 'TaskCreatetionRouteArgs{key: $key, todo: $todo}';
  }
}
