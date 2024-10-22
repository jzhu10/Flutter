import 'package:flutter/material.dart';

class LimitedText extends StatelessWidget {
  final String text;
  final int count;
  final TextStyle? style;
  const LimitedText(
      {super.key,
      required this.text,
      required this.count,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.length <= count ? text : '${text.substring(0, count)}..',
      style: style,
    );
  }
}
