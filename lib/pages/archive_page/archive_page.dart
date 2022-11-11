import 'package:flutter/material.dart';
import '../../blocs/blocs.dart';
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
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          sliver: SliverToBoxAdapter(
            child: BlocBuilder<TodoListBloc, TodoListState>(
              builder: (ctx, state) => TodoList(todos: state.archivedTodos),
            ),
          ),
        ),
      ]),
    );
  }
}
