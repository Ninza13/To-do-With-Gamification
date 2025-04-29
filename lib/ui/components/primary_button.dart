import 'package:flutter/material.dart';

import '../../common/extensions/text_style.dart';
import '../base/base_button.dart';
import '../theme/style_manager.dart';
import '../theme/theme_colors.dart';
import 'loader.dart';

final class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    this.isDisabled = false,
    this.isLoading = false,
    super.key,
    this.onPressed,
    this.height,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final String text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return BaseButton(
      color: colors.primary,
      pressedColor: colors.primaryHover,
      isDisabled: isDisabled,
      onPressed: onPressed,
      height: height,
      child: isLoading
          ? const Loader(
              size: 26,
              color: Colors.white,
            )
          : Text(
              text,
              style: StyleManager.s14.medium.withColor(
                colors.onPrimary,
              ),
            ),
    );
  }
}
