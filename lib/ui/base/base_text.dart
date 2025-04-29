import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const BaseText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.bodyMedium, // Default style
      textAlign: textAlign ?? TextAlign.start, // Default alignment
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis, // Default overflow
    );
  }
}
