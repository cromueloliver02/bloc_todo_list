import 'package:flutter/material.dart';

class TDLSliverAppBar extends StatelessWidget {
  const TDLSliverAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      toolbarHeight: 60,
      centerTitle: false,
      forceElevated: false,
      backgroundColor: theme.colorScheme.primary,
      title: Row(
        children: [
          const Icon(Icons.calendar_today),
          const SizedBox(width: 5),
          Text(
            title,
            style: theme.appBarTheme.titleTextStyle,
          ),
        ],
      ),
      actions: actions,
    );
  }
}
