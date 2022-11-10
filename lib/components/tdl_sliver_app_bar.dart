import 'package:flutter/material.dart';
import '../utils/functions.dart';

class TDLSliverAppBar extends StatelessWidget {
  const TDLSliverAppBar({super.key});

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
            'Todo List',
            style: theme.appBarTheme.titleTextStyle,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => showTodoModal(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
