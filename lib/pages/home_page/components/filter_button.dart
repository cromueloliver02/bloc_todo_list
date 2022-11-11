import 'package:flutter/material.dart';
import '../../../blocs/blocs.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.title,
    required this.isCurrent,
    required this.filter,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Filter filter;
  final bool isCurrent;
  final void Function(Filter) onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: () => onPressed(filter),
      child: Text(
        title,
        style: theme.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w600,
          color: isCurrent ? theme.primaryColorLight : Colors.grey,
        ),
      ),
    );
  }
}
