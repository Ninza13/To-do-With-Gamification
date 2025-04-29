import 'package:flutter/material.dart';
import 'package:to_do_app/ui/components/svg_icon.dart';
import 'package:to_do_app/ui/constants/icons.dart';
import 'package:to_do_app/ui/theme/style_manager.dart';
import 'package:to_do_app/ui/theme/theme_colors.dart';

import '../../../common/extensions/text_style.dart';

final class BottomNavigatorItem extends StatelessWidget {
  const BottomNavigatorItem({
    required this.isActive,
    required this.icon,
    required this.iconActive,
    required this.label,
    required this.onTap,
    super.key,
  });

  final bool isActive;
  final AppIcons icon;
  final AppIcons iconActive;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color =
        isActive
            ? ThemeColors.of(context).textMain
            : ThemeColors.of(context).hint;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 8),
          child: SizedBox(
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgIcon(isActive ? iconActive : icon),
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      style: StyleManager.s12.withColor(color),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
