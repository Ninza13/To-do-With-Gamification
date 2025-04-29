import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/icons.dart';
import '../theme/theme_colors.dart';

final class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.icon, {
    this.color,
    this.useDefaultColor = false,
    this.size = 20,
    super.key,
  })  : height = null,
        width = null;

  const SvgIcon.dimensions(
    this.icon, {
    required this.height,
    required this.width,
    this.useDefaultColor = false,
    this.color,
    super.key,
  }) : size = null;

  const SvgIcon.full(
    this.icon, {
    this.useDefaultColor = false,
    this.color,
    super.key,
  })  : size = double.maxFinite,
        height = null,
        width = null;

  final AppIcons icon;
  final Color? color;
  final bool useDefaultColor;
  final double? size;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon.path,
      height: size ?? height,
      width: size ?? width,
      colorFilter: !useDefaultColor
          ? ColorFilter.mode(
              color ?? ThemeColors.of(context).textMain,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
