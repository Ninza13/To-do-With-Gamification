import 'package:flutter/material.dart';

final class BaseButton extends StatefulWidget {
  const BaseButton({
    required this.child,
    this.height,
    this.isDisabled = false,
    super.key,
    this.onPressed,
    this.radius,
    this.color,
    this.pressedColor,
    this.pressedShadow,
    this.shadow,
  });

  final VoidCallback? onPressed;
  final bool isDisabled;
  final BorderRadius? radius;
  final Color? color;
  final Color? pressedColor;
  final Widget child;
  final List<BoxShadow>? pressedShadow;
  final List<BoxShadow>? shadow;
  final double? height;

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isDisabled ? 0.5 : 1,
      child: GestureDetector(
        onTap: widget.isDisabled ? null : widget.onPressed,
        onTapDown: (_) {
          if (widget.isDisabled) return;
          setState(() => isPressed = true);
        },
        onTapUp: (_) {
          if (widget.isDisabled) return;
          Future.delayed(
            const Duration(milliseconds: 100),
            () => setState(() => isPressed = false),
          );
        },
        onTapCancel: () => setState(() => isPressed = false),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: widget.radius ?? BorderRadius.circular(12),
            color: isPressed ? widget.pressedColor ?? widget.color : widget.color,
            boxShadow: isPressed ? widget.pressedShadow ?? widget.shadow : widget.shadow,
          ),
          child: SizedBox(
            height: widget.height ?? 48,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 84,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Center(
                  child: FittedBox(
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
