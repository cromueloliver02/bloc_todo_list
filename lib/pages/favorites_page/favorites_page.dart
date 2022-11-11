import 'package:flutter/material.dart';
import '../../blocs/blocs.dart';
import '../../components/components.dart';

class FavoritesPage extends StatelessWidget {
  static const id = '/favorites';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const TDLSliverAppBar(title: 'Favorites'),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        sliver: SliverToBoxAdapter(
          child: BlocBuilder<FavoriteTodosBloc, FavoriteTodosState>(
            builder: (ctx, state) => TodoList(todos: state.favoriteTodos),
          ),
        ),
      ),
    ]);
  }
}
