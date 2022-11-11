import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import '../models/todo.dart';
import '../utils/functions.dart';
import '../utils/constants.dart';

class TDLTodoTile extends StatelessWidget {
  const TDLTodoTile({
    super.key,
    required this.todo,
  });

  final Todo todo;

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
