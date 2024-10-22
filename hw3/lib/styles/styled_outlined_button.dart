import 'package:flutter/material.dart';

class StyledOutlinedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool isSelected;
  const StyledOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? Theme.of(context).colorScheme.surfaceDim
            : Colors.white,
        side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        textStyle: Theme.of(context).textTheme.labelLarge,
        foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        visualDensity: VisualDensity.compact,
      ),
      child: Text(text),
    );
  }
}
