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
            builder: (ctx, state) => TDLTodoList(
              todos: state.favoriteTodos,
              emptyMessage: 'No favorite tasks yet',
              emptyAnimation:
                  'https://assets1.lottiefiles.com/private_files/lf30_e3pteeho.json',
            ),
          ),
        ),
      ),
    ]);
  }
}
