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
    InstantRoute(
      page: AuthWrapperRoute.page,
      keepHistory: false,
      initial: false,
      children: [
        InstantRoute(page: SplashRoute.page, keepHistory: false, initial: true),
        InstantRoute(page: OnboardingRoute.page, keepHistory: false),
      ],
    ),

    // Inside
    InstantRoute(
      initial: true,
      page: MainWrapperRoute.page,
      keepHistory: false,
      children: [
        InstantRoute(
          initial: true,
          page: HomeWrapperRoute.page,
          keepHistory: false,
          children: [
            InstantRoute(
              initial: true,
              page: HomeRoute.page,
              keepHistory: false,
            ),

            InstantRoute(
              page: TaskCreateWrapperRoute.page,
              keepHistory: false,
              children: [
                InstantRoute(
                  initial: true,
                  page: TaskCreatetionRoute.page,
                  keepHistory: false,
                ),
              ],
            ),
          ],
        ),
        // Shop
        InstantRoute(
          page: ShopWrapperRoute.page,
          keepHistory: false,
          children: [
            InstantRoute(
              initial: true,
              page: ShopRoute.page,
              keepHistory: false,
            ),
          ],
        ),

        // Task create
        InstantRoute(
          page: TaskCreateWrapperRoute.page,
          keepHistory: false,
          children: [
            InstantRoute(
              initial: true,
              page: TaskCreatetionRoute.page,
              keepHistory: false,
            ),
          ],
        ),
        // Badge route
        InstantRoute(
          page: BadgeWrapperRoute.page,
          keepHistory: false,
          children: [
            InstantRoute(
              initial: true,
              page: BadgeRoute.page,
              keepHistory: false,
            ),
          ],
        ),

        // Profile route
        InstantRoute(
          page: ProfileWrapperRoute.page,
          keepHistory: false,
          children: [
            InstantRoute(
              initial: true,
              page: ProfileRoute.page,
              keepHistory: false,
            ),
          ],
        ),
      ],
    ),
  ];
}
