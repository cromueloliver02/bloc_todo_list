import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';
import '../../models/todo.dart';
import '../../components/components.dart';

class ArchivePage extends StatelessWidget {
  static const id = '/archive';

  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TDLDrawer(),
      body: CustomScrollView(slivers: [
        const TDLSliverAppBar(title: 'Archive'),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: BlocSelector<TodoListBloc, TodoListState, List<Todo>>(
            selector: (state) => state.archivedTodos,
            builder: (context, archivedTodos) => SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: archivedTodos.length,
                (ctx, idx) {
                  final archivedTodo = archivedTodos[idx];

                  return TDLTodoTile(todo: archivedTodo);
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
