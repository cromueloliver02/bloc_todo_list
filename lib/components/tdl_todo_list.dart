import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

import '../models/todo.dart';
import '../utils/utils.dart';
import './components.dart';

class TDLTodoList extends StatelessWidget {
  const TDLTodoList({
    Key? key,
    required this.todos,
    required this.emptyMessage,
    this.hideCheckbox = false,
    this.emptyAnimation =
        'https://assets10.lottiefiles.com/packages/lf20_iikbn1ww.json',
  }) : super(key: key);

  final List<Todo> todos;
  final String emptyMessage;
  final bool hideCheckbox;
  final String emptyAnimation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (todos.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: Text(
                emptyMessage,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 10),
            Lottie.network(
              emptyAnimation,
              height: 300,
            ),
          ],
        ),
      );
    }

    return ExpansionPanelList.radio(
      children: List.generate(
        todos.length,
        (idx) {
          final todo = todos[idx];
          final dateTime = DateFormat.jm().add_yMMMd().format(todo.dateTime);

          return ExpansionPanelRadio(
            value: todo.id,
            canTapOnHeader: true,
            headerBuilder: (ctx, isOpen) => TDLTodoTile(
              todo: todo,
              hideCheckbox: hideCheckbox,
            ),
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
