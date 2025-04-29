import 'package:flutter/material.dart';

import '../../common/extensions/text_style.dart';
import '../constants/icons.dart';
import '../theme/style_manager.dart';
import 'svg_icon.dart';

final class SvgIconButton extends StatelessWidget {
  const SvgIconButton(
    this.icon, {
    this.onTap,
    super.key,
    this.color,
    this.label,
    this.useDefaultColor = false,
    this.spacing,
  });

  final AppIcons icon;
  final Color? color;
  final VoidCallback? onTap;
  final String? label;
  final bool useDefaultColor;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final icon = SvgIcon(
      this.icon,
      color: color,
      useDefaultColor: useDefaultColor,
    );

    if (label != null) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 11,
          ),
          child: Row(
            children: [
              icon,
              SizedBox(width: spacing ?? 8),
              Text(label!, style: StyleManager.s12.medium),
            ],
          ),
        ),
      );
    }
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: icon,
      ),
    );
  }
}
