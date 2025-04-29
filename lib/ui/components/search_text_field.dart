import 'package:flutter/material.dart';

import '../base/base_text_field.dart';
import '../constants/icons.dart';

final class SearchTextField extends StatefulWidget {
  const SearchTextField({
    this.hint,
    super.key,
  });

  final String? hint;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool isFocused = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      hint: widget.hint,
      shape: const StadiumBorder(),
      prefixIcon: AppIcons.search,
      suffixIcon: AppIcons.microphone,
      suffixEnabled: isFocused || isActive,
      onFocusChanged: (value) {
        if (isFocused != value) setState(() => isFocused = value);
      },
      onActiveChanged: (value) {
        if (isActive != value) setState(() => isActive = value);
      },
    );
  }
}
