import 'package:flutter/material.dart';
import 'package:to_do_app/ui/constants/images.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = false,
    this.showUserAvatar = true,
  });

  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final bool showUserAvatar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading:
          showUserAvatar
              ? Image.asset(AppImages.user.path, width: 40, height: 40)
              : leading,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
