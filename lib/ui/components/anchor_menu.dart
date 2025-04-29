import 'package:flutter/material.dart';
import 'package:to_do_app/common/colors.dart';

import '../theme/theme_colors.dart';

class AnchorMenu extends StatefulWidget {
  const AnchorMenu({
    required this.attachTo,
    required this.enabled,
    required this.menuEntry,
    super.key,
  });

  final Widget attachTo;
  final bool enabled;
  final Widget menuEntry;

  @override
  State<AnchorMenu> createState() => _AnchorMenuState();
}

class _AnchorMenuState extends State<AnchorMenu> with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    if (widget.enabled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showEntry();
      });
    }
  }

  @override
  void didUpdateWidget(covariant AnchorMenu oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.enabled != oldWidget.enabled ||
        widget.menuEntry != oldWidget.menuEntry) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.enabled) {
          showEntry();
        } else {
          hideEntry();
        }
      });
    }
  }

  void showEntry() {
    removeEntry();

    final renderBox = context.findRenderObject() as RenderBox?;
    final size = renderBox?.size;
    if (size == null) return;

    const topRight = BorderRadius.only(topRight: Radius.circular(16));
    final radius = BorderRadius.circular(16) - topRight;

    entry = OverlayEntry(
      builder:
          (context) => Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ThemeColors.of(context).background,
                  borderRadius: radius,
                  boxShadow: const [
                    BoxShadow(color: AppColors.shadow, blurRadius: 6),
                  ],
                ),
                child: ClipRRect(borderRadius: radius, child: widget.menuEntry),
              ),
            ),
          ),
    );

    Overlay.of(context).insert(entry!);
  }

  void hideEntry() {
    removeEntry();
  }

  void removeEntry() {
    entry?.remove();
    entry = null;
  }

  @override
  void dispose() {
    removeEntry();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(link: _layerLink, child: widget.attachTo);
  }
}
