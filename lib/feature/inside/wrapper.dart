import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/app/router/router.gr.dart';
import 'package:to_do_app/feature/inside/components/bottom_navigator.dart';
import 'package:to_do_app/feature/inside/components/page_overlay.dart';
import 'package:to_do_app/ui/theme/theme_colors.dart';

@RoutePage()
final class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key});

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  bool isDimmed = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: ThemeColors.of(context).background,
      ),
      child: AutoTabsRouter(
        transitionBuilder: (context, child, animation) {
          return child;
        },
        routes: const [HomeRoute(), ShopRoute(), BadgeRoute(), ProfileRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return PopScope(
            canPop: tabsRouter.activeIndex == 0 || isDimmed,
            onPopInvoked: (didPop) {
              if (!isDimmed) {
                tabsRouter.setActiveIndex(0);
              }
            },
            child: Scaffold(
              extendBody: true,
              body: PageOverlay(
                isDimmed: isDimmed,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: child,
                ),
                disableDim: () {
                  setState(() {
                    isDimmed = false;
                  });
                },
              ),
              bottomNavigationBar: BottomNavigator(
                activeIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                setDim: (value) {
                  setState(() {
                    isDimmed = value;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
