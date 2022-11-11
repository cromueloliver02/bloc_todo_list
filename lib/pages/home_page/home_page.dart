import 'package:flutter/material.dart';
import '../../blocs/blocs.dart';
import '../../components/components.dart';
import './components/top_action_bar.dart';
import '../../utils/utils.dart';

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
        sliver: SliverToBoxAdapter(
          child: BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
            builder: (ctx, state) => TDLTodoList(
              todos: state.filteredTodos,
              emptyMessage: 'What is your main focus today?',
              emptyAnimation:
                  'https://assets2.lottiefiles.com/packages/lf20_ZcIjtY.json',
            ),
          ),
        ),
      ),
    ]);
  }
}
