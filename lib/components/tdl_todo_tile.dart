import 'package:flutter/material.dart';

import '../blocs/blocs.dart';
import '../models/todo.dart';
import '../utils/utils.dart';

class TDLTodoTile extends StatelessWidget {
  const TDLTodoTile({
    Key? key,
    required this.todo,
    this.hideCheckbox = false,
  }) : super(key: key);

  final Todo todo;
  final bool hideCheckbox;

  void _onSelected(BuildContext ctx, PopButtonType type) async {
    final todoListBloc = ctx.read<TodoListBloc>();

    switch (type) {
      case PopButtonType.edit:
        showTodoModal(ctx, todo);
        break;
      case PopButtonType.delete:
        final response = await showConfirmDialog(
          ctx,
          title: 'Confirm delete',
          description: 'Are you sure you want to delete?',
        );

        if (response != null && !response) break;

        todoListBloc.add(DeleteTodoEvent(id: todo.id));
        break;
      case PopButtonType.archive:
        todoListBloc.add(ArchiveTodoEvent(id: todo.id));
        break;
      case PopButtonType.restore:
        todoListBloc.add(RestoreTodoEvent(id: todo.id));
        break;
    }
  }

  void _toggleDone(BuildContext ctx) =>
      ctx.read<TodoListBloc>().add(ToggleDoneTodoEvent(id: todo.id));

  void _toggleFavorite(BuildContext ctx) =>
      ctx.read<TodoListBloc>().add(ToggleFavoriteTodoEvent(id: todo.id));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: !todo.isArchived
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!hideCheckbox)
                    Checkbox(
                      value: todo.isDone,
                      onChanged: (value) => _toggleDone(context),
                    ),
                  GestureDetector(
                    onTap: () => _toggleFavorite(context),
                    child: Icon(
                      todo.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            : Text(
                todo.title,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyText1!.copyWith(
                  fontSize: kRegularFontSize,
                  fontWeight: FontWeight.normal,
                ),
              ),
        title: !todo.isArchived
            ? Text(
                todo.title,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyText1!.copyWith(
                  fontSize: kRegularFontSize,
                  fontWeight: FontWeight.normal,
                ),
              )
            : null,
        trailing: PopupMenuButton<PopButtonType>(
          onSelected: (type) => _onSelected(context, type),
          itemBuilder: (ctx) => [
            PopupMenuItem(
              value: PopButtonType.edit,
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
              value: PopButtonType.delete,
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
            if (!todo.isArchived)
              PopupMenuItem(
                value: PopButtonType.archive,
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
            if (todo.isArchived)
              PopupMenuItem(
                value: PopButtonType.restore,
                child: Row(
                  children: [
                    Icon(
                      Icons.unarchive,
                      color: theme.iconTheme.color,
                    ),
                    const SizedBox(width: 8),
                    const Text('Restore'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

enum PopButtonType { edit, delete, archive, restore }
