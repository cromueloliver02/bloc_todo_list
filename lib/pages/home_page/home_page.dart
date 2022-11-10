import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';
import '../../components/components.dart';
import '../../models/todo.dart';
import './components/top_action_bar.dart';
import '../../utils/functions.dart';

class HomePage extends StatelessWidget {
  static const id = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      TDLSliverAppBar(
        title: 'Todo List',
        actions: [
          IconButton(
            onPressed: () => showTodoModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      const SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        sliver: SliverToBoxAdapter(
          child: TopActionBar(),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: BlocSelector<TodoListBloc, TodoListState, List<Todo>>(
          selector: (state) => state.todos,
          builder: (ctx, todos) => SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: todos.length,
              (ctx, idx) {
                final todo = todos[idx];

                return TDLTodoTile(todo: todo);
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
