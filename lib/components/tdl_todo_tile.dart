import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';
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
        (() {})(); // archive function
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const popupButtons = [
      Tuple3('Edit', Icons.edit, PopButtonType.edit),
      Tuple3('Delete', Icons.delete, PopButtonType.delete),
      Tuple3('Archive', Icons.archive, PopButtonType.archive),
    ];

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
          itemBuilder: (ctx) => popupButtons
              .map((d) => PopupMenuItem(
                    value: d.item3,
                    child: Row(
                      children: [
                        Icon(
                          d.item2,
                          color: theme.iconTheme.color,
                        ),
                        const SizedBox(width: 8),
                        Text(d.item1),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

enum PopButtonType { edit, delete, archive }
