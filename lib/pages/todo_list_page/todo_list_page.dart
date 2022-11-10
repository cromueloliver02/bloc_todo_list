import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../components/components.dart';
import './components/top_action_bar.dart';
import '../../utils/functions.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showTodoModal(context),
          child: const Icon(Icons.add),
        ),
        body: CustomScrollView(slivers: [
          const TDLSliverAppBar(),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: TopActionBar(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 15,
                (ctx, idx) => const TDLTodoTile(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
