import 'package:flutter/material.dart';

class TDLButton extends StatelessWidget {
  const TDLButton({
    super.key,
    required this.label,
    required this.type,
    required this.onPressed,
    this.labelColor,
  });

  final String label;
  final ButtonType type;
  final VoidCallback onPressed;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (type == ButtonType.text) {
      return TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: theme.textTheme.headline6!.copyWith(
            color: labelColor ?? theme.textTheme.headline6!.color,
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: theme.textTheme.headline6!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

enum ButtonType { elevated, text }
