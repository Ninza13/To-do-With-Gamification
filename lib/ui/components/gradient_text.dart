import 'package:flutter/material.dart';

import '../theme/theme_colors.dart';

final class GradientText extends StatefulWidget {
  const GradientText(
    this.data, {
    super.key,
    this.style,
  });

  final String data;
  final TextStyle? style;

  @override
  State<GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> {
  GlobalKey textKey = GlobalKey();
  RenderBox? renderBox;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        renderBox = textKey.currentContext!.findRenderObject()! as RenderBox;
      });
    });
  }

  Shader? getTextGradient() {
    if (renderBox == null) return null;
    return ThemeColors.of(context).primaryGradient.createShader(
          Rect.fromLTWH(
            20,
            20,
            renderBox!.size.width,
            renderBox!.size.height,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final shader = getTextGradient();
    return Text(
      key: textKey,
      widget.data,
      style: (widget.style ?? const TextStyle()).copyWith(
        color: shader == null ? ThemeColors.of(context).onPrimary : null,
        foreground: shader == null ? null : Paint()
          ?..shader = shader,
      ),
    );
  }
}
