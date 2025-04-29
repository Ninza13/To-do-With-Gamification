import 'package:flutter/material.dart';

import 'package:to_do_app/common/colors.dart';
import 'package:to_do_app/common/strings.dart';
import 'package:to_do_app/feature/inside/task_creatation/task_createtion_screen.dart';
import 'package:to_do_app/ui/constants/icons.dart';
import 'package:to_do_app/ui/theme/theme_colors.dart';

import 'bottom_navigator_item.dart';

final class BottomNavigator extends StatefulWidget {
  const BottomNavigator({
    required this.activeIndex,
    required this.onTap,
    required this.setDim,
    super.key,
  });

  final int activeIndex;
  final ValueChanged<int> onTap;
  final ValueChanged<bool> setDim;

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  late final colors = ThemeColors.of(context);
  bool bottomSheetShown = false;

  void onIndexedTap(int index) {
    if (bottomSheetShown) {
      Navigator.pop(context);
      widget.setDim(false);
      setState(() {
        bottomSheetShown = false;
      });
    }
    widget.onTap(index);
  }

  void showBottomSheet() {
    if (bottomSheetShown) return;
    setState(() {
      bottomSheetShown = true;
    });
    widget.setDim(true);
    Scaffold.of(context)
        .showBottomSheet(
          (context) => const TaskCreatetionScreen(),
          backgroundColor: colors.background,
        )
        .closed
        .whenComplete(() {
          widget.setDim(false);

          setState(() {
            bottomSheetShown = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.background,
        boxShadow:
            bottomSheetShown
                ? null
                : [const BoxShadow(blurRadius: 6, color: AppColors.shadow)],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigatorItem(
              isActive: widget.activeIndex == 0 && !bottomSheetShown,
              icon: AppIcons.home,
              iconActive: AppIcons.homeBold,
              label: AppStrings.home,
              onTap: () => onIndexedTap(0),
            ),
            BottomNavigatorItem(
              isActive: widget.activeIndex == 1 && !bottomSheetShown,
              icon: AppIcons.shop,
              iconActive: AppIcons.shopBold,
              label: AppStrings.shop,
              onTap: () => onIndexedTap(1),
            ),
            BottomNavigatorItem(
              isActive: bottomSheetShown,
              icon: AppIcons.addSquare,
              iconActive: AppIcons.addBold,
              label: AppStrings.addTask,
              onTap: showBottomSheet,
            ),
            BottomNavigatorItem(
              isActive: widget.activeIndex == 2 && !bottomSheetShown,
              icon: AppIcons.badge,
              iconActive: AppIcons.badgeBold,
              label: AppStrings.badge,
              onTap: () => onIndexedTap(2),
            ),
            BottomNavigatorItem(
              isActive: widget.activeIndex == 3 && !bottomSheetShown,
              icon: AppIcons.user,
              iconActive: AppIcons.userBold,
              label: AppStrings.profile,
              onTap: () => onIndexedTap(3),
            ),
          ],
        ),
      ),
    );
  }
}
