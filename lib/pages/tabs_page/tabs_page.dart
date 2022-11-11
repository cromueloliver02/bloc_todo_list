import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../blocs/blocs.dart';
import '../../components/components.dart';
import '../../pages/pages.dart';
import '../../utils/functions.dart';

class TabsPage extends StatelessWidget {
  static const id = '/tabs';

  const TabsPage({super.key});

  final _screens = const [
    HomePage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: SafeArea(
        top: false,
        child: BlocSelector<TabBloc, TabState, int>(
          selector: (state) => state.index,
          builder: (ctx, index) => Scaffold(
            drawer: const TDLDrawer(),
            floatingActionButton: FloatingActionButton(
              onPressed: () => showTodoModal(context),
              child: const Icon(Icons.add),
            ),
            body: IndexedStack(
              index: index,
              children: _screens,
            ),
            bottomNavigationBar: TDLBottomNavBar(
              currentTab: index,
              onPressed: (idx) =>
                  ctx.read<TabBloc>().add(ChangeTabEvent(index: idx)),
            ),
          ),
        ),
      ),
    );
  }
}
