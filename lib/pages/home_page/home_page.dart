import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../components/components.dart';
import './components/top_action_bar.dart';
import '../../utils/functions.dart';

class HomePage extends StatelessWidget {
  static const id = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: Scaffold(
        drawer: const TDLDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showTodoModal(context),
          child: const Icon(Icons.add),
        ),
        body: CustomScrollView(slivers: [
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
