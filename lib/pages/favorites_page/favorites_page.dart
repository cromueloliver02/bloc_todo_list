import 'package:flutter/material.dart';
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
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 15,
            (ctx, idx) => const TDLTodoTile(),
          ),
        ),
      ),
    ]);
  }
}
