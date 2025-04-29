import 'package:flutter/material.dart';
import 'package:to_do_app/common/colors.dart';

final class PageOverlay extends StatelessWidget {
  const PageOverlay({
    required this.child,
    required this.isDimmed,
    required this.disableDim,
    super.key,
  });

  final Widget child;
  final bool isDimmed;
  final VoidCallback disableDim;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(child: child),
        IgnorePointer(
          ignoring: !isDimmed,
          child: GestureDetector(
            onTap: () {
              disableDim();
              Navigator.pop(context);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              // ignore: deprecated_member_use
              color:
                  isDimmed
                      ? AppColors.black200.withOpacity(0.42)
                      : Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
