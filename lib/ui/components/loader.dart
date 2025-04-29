import 'package:flutter/material.dart';

import '../constants/icons.dart';
import 'svg_icon.dart';

final class Loader extends StatefulWidget {
  const Loader({
    super.key,
    this.size,
    this.color,
  });

  final double? size;
  final Color? color;

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(begin: 1, end: 0).animate(controller),
      child: SvgIcon(
        AppIcons.loader,
        color: widget.color ?? Colors.black,
        size: widget.size ?? 32,
      ),
    );
  }
}
