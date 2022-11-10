import 'package:flutter/material.dart';

class TDLButton extends StatelessWidget {
  const TDLButton({
    super.key,
    required this.label,
    required this.type,
    required this.onPressed,
    this.iconData,
    this.labelColor,
  });

  final String label;
  final IconData? iconData;
  final ButtonType type;
  final VoidCallback onPressed;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (type == ButtonType.text) {
      return TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconData != null) ...[
              Icon(
                iconData,
                size: 30,
                color: theme.primaryColorLight,
              ),
              const SizedBox(width: 10),
            ],
            Text(
              label,
              style: theme.textTheme.headline6!.copyWith(
                color: labelColor ?? theme.textTheme.headline6!.color,
              ),
            ),
          ],
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconData != null) ...[
            Icon(
              iconData,
              size: 30,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 10),
          ],
          Text(
            label,
            style: theme.textTheme.headline6!.copyWith(
              color: labelColor ?? theme.textTheme.headline6!.color,
            ),
          ),
        ],
      ),
    );
  }
}

enum ButtonType { elevated, text }
