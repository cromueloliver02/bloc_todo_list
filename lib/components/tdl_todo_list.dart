import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todo.dart';
import './components.dart';
import '../utils/utils.dart';

class TDLTodoList extends StatelessWidget {
  const TDLTodoList({
    Key? key,
    required this.todos,
  }) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ExpansionPanelList.radio(
      children: List.generate(
        todos.length,
        (idx) {
          final todo = todos[idx];
          final dateTime = DateFormat.jm().add_yMMMd().format(todo.dateTime);

          return ExpansionPanelRadio(
            value: todo.id,
            canTapOnHeader: true,
            headerBuilder: (ctx, isOpen) => TDLTodoTile(todo: todo),
            body: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                title: Text(
                  todo.description,
                  style: theme.textTheme.bodyText2!.copyWith(
                    fontSize: kRegularFontSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(dateTime),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
