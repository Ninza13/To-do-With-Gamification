import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/common/colors.dart';
import 'package:to_do_app/common/extensions/text_style.dart';

import '../components/svg_icon.dart';
import '../constants/icons.dart';
import '../theme/style_manager.dart';
import '../theme/theme_colors.dart';

final class BaseTextField extends StatefulWidget {
  const BaseTextField({
    this.inputFormatters,
    this.maxLength,
    this.keyboardType,
    this.hint,
    this.isLoading = false,
    this.style,
    this.radius,
    this.suffixIcon,
    this.onSuffixTap,
    this.onFocusChanged,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.autofillHints,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.onActiveChanged,
    this.onPrefixTap,
    this.prefixIcon,
    this.prefixEnabled = true,
    this.suffixEnabled = true,
    super.key,
    this.shape,
    this.error,
  });

  final bool isLoading;
  final bool obscureText;
  final bool prefixEnabled;
  final bool suffixEnabled;

  final String? hint;
  final String? error;
  final TextStyle? style;
  final BorderRadius? radius;

  final VoidCallback? onSuffixTap;
  final VoidCallback? onPrefixTap;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<bool>? onActiveChanged;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  final FocusNode? focusNode;
  final AppIcons? suffixIcon;
  final AppIcons? prefixIcon;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final TextInputType? keyboardType;
  final ShapeBorder? shape;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late final colors = ThemeColors.of(context);
  late final FocusNode focusNode;

  bool isActive = false;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(onFocusChanged);
  }

  @override
  void dispose() {
    focusNode
      ..removeListener(onFocusChanged)
      ..dispose();
    super.dispose();
  }

  void onFocusChanged() {
    final value = focusNode.hasFocus;
    widget.onFocusChanged?.call(value);
    if (value != isFocused) {
      setState(() {
        isFocused = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.error != null ? AppColors.red : null;
    final borderGradient = widget.error != null ? null : colors.mainGradient;
    final backgroundColor =
        widget.isLoading
            ? colors.backgroundDisabled
            : isActive || isFocused || widget.error != null
            ? colors.background
            : colors.container;

    return GestureDetector(
      onTap: focusNode.requestFocus,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        height: 48,
        decoration:
            widget.shape != null
                ? ShapeDecoration(
                  gradient: borderGradient,
                  color: borderColor,
                  shape: widget.shape!,
                )
                : BoxDecoration(
                  gradient: borderGradient,
                  color: borderColor,
                  borderRadius: widget.radius ?? BorderRadius.circular(12),
                ),
        padding:
            isFocused || widget.error != null
                ? const EdgeInsets.all(1)
                : EdgeInsets.zero,
        child: AnimatedContainer(
          height: double.maxFinite,
          duration: const Duration(milliseconds: 50),
          padding: EdgeInsets.symmetric(
            horizontal: 8 + (isFocused || widget.error != null ? 0 : 1),
          ),
          decoration:
              widget.shape != null
                  ? ShapeDecoration(
                    shape: widget.shape!,
                    color: backgroundColor,
                  )
                  : BoxDecoration(
                    borderRadius:
                        (widget.radius ?? BorderRadius.circular(12)) -
                        BorderRadius.circular(1),
                    color: backgroundColor,
                  ),
          child: Row(
            children: [
              _Icon(
                isActive: isActive,
                isFocused: isFocused,
                icon: widget.prefixIcon,
                enabled: widget.prefixEnabled,
                onTap: widget.onPrefixTap,
              ),
              Expanded(
                child: TextField(
                  obscureText: widget.obscureText,
                  textInputAction: widget.textInputAction,
                  autofillHints: widget.autofillHints,
                  controller: widget.controller,
                  inputFormatters: widget.inputFormatters,
                  maxLength: widget.maxLength,
                  focusNode: focusNode,
                  keyboardType: widget.keyboardType,
                  onChanged: (value) {
                    widget.onChanged?.call(value);
                    if (value.isNotEmpty != isActive) {
                      widget.onActiveChanged?.call(value.isNotEmpty);
                      setState(() {
                        isActive = value.isNotEmpty;
                      });
                    }
                  },
                  style: (widget.style ?? StyleManager.s14).withColor(
                    widget.isLoading ? colors.textDisabled : colors.textMain,
                  ),
                  enableInteractiveSelection: !widget.isLoading,
                  enabled: !widget.isLoading,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    isCollapsed: true,
                    enabled: !widget.isLoading,
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: widget.hint,
                    hintStyle: (widget.style ?? StyleManager.s14).withColor(
                      widget.isLoading ? colors.hintDisabled : colors.hint,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              _Icon(
                isActive: isActive,
                isFocused: isFocused,
                icon: widget.suffixIcon,
                enabled: widget.suffixEnabled,
                onTap: widget.onSuffixTap,
                error: widget.error,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _Icon extends StatelessWidget {
  const _Icon({
    required this.isFocused,
    required this.isActive,
    this.enabled = true,
    this.icon,
    this.onTap,
    this.error,
  });

  final AppIcons? icon;
  final bool enabled;
  final bool isFocused;
  final bool isActive;
  final VoidCallback? onTap;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    if ((icon == null || !enabled) && error == null) {
      return const SizedBox(width: 8);
    }
    return InkWell(
      onTap:
          error != null
              ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    content: Text(
                      error!,
                      style: StyleManager.s14.withColor(AppColors.white),
                    ),
                  ),
                  snackBarAnimationStyle: AnimationStyle(
                    duration: Duration.zero,
                  ),
                );
              }
              : onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgIcon(
          error != null ? AppIcons.infoCircle : icon!,
          color:
              error != null
                  ? AppColors.red
                  : isActive || isFocused
                  ? colors.textMain
                  : colors.hint,
        ),
      ),
    );
  }
}
