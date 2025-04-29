import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_app/app/router/router.gr.dart';
import 'package:to_do_app/app/router/transitions/export.dart';

@Singleton()
@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
class AppRouter extends RootStackRouter {
  static const String _replaceRouteName = 'Screen,Route';

  @override
  List<AutoRoute> get routes => [
    InstantRoute(page: SplashRoute.page, keepHistory: false, initial: true),
    InstantRoute(page: OnboardingOneRoute.page, keepHistory: false),
    InstantRoute(page: OnboardingRoute.page, keepHistory: false),
    InstantRoute(page: OnboardingTwoRoute.page, keepHistory: false),
    // Inside
    InstantRoute(
      initial: false,
      page: MainWrapperRoute.page,
      keepHistory: false,
      children: [
        InstantRoute(initial: true, page: HomeRoute.page, keepHistory: false),
        InstantRoute(page: BadgeRoute.page, keepHistory: false),
        InstantRoute(page: ShopRoute.page, keepHistory: false),

        InstantRoute(
          initial: false,
          page: SettingsRoute.page,
          keepHistory: false,
        ),

        InstantRoute(page: ProfileRoute.page, keepHistory: false),

        InstantRoute(page: TaskCreatetionRoute.page, keepHistory: false),
      ],
    ),
  ];
}
