import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../utils/constants.dart';

class TDLTodoTile extends StatelessWidget {
  const TDLTodoTile({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (value) {},
        ),
        title: Text(
          todo.title,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyText1!.copyWith(
            fontSize: kRegularFontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: PopupMenuButton(
          itemBuilder: (ctx) => [
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: theme.iconTheme.color,
                  ),
                  const SizedBox(width: 8),
                  const Text('Edit'),
                ],
              ),
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: theme.iconTheme.color,
                  ),
                  const SizedBox(width: 8),
                  const Text('Delete'),
                ],
              ),
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.archive,
                    color: theme.iconTheme.color,
                  ),
                  const SizedBox(width: 8),
                  const Text('Archive'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
