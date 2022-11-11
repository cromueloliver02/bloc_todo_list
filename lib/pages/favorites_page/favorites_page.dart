import 'package:flutter/material.dart';
import '../../blocs/blocs.dart';
import '../../models/todo.dart';
import '../../components/components.dart';

class FavoritesPage extends StatelessWidget {
  static const id = '/favorites';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const TDLSliverAppBar(title: 'Favorites'),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: BlocSelector<FavoriteTodosBloc, FavoriteTodosState, List<Todo>>(
          selector: (state) => state.favoriteTodos,
          builder: (context, favoriteTodos) => SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: favoriteTodos.length,
              (ctx, idx) {
                final favoriteTodo = favoriteTodos[idx];

                return TDLTodoTile(todo: favoriteTodo);
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
