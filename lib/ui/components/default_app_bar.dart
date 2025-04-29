import 'package:flutter/material.dart';

import '../../common/extensions/text_style.dart';
import '../constants/icons.dart';
import '../theme/style_manager.dart';
import 'svg_icon.dart';
import 'svg_icon_button.dart';

final class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 58,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            // const ProfileAvatar(),
            const SizedBox(width: 8),
            Expanded(
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text("User", style: StyleManager.s20.medium),
                      const SizedBox(width: 8),
                      const SvgIcon(AppIcons.chevronDown),
                    ],
                  ),
                ),
              ),
            ),
            const SvgIconButton(AppIcons.notification),
          ],
        ),
      ),
    );
  }
}
