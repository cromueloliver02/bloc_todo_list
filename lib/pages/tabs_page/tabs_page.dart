import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../blocs/blocs.dart';
import '../../components/components.dart';
import '../../pages/pages.dart';
import '../../utils/utils.dart';

class TabsPage extends StatelessWidget {
  static const id = '/tabs';

  const TabsPage({super.key});

  final _screens = const [
    HomePage(),
    FavoritesPage(),
  ];

  void _onPressed(BuildContext ctx, int idx) =>
      ctx.read<TabBloc>().add(ChangeTabEvent(index: idx));

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
            floatingActionButton: index == 0
                ? FloatingActionButton(
                    onPressed: () => showTodoModal(context),
                    child: const Icon(Icons.add),
                  )
                : null,
            body: IndexedStack(
              index: index,
              children: _screens,
            ),
            bottomNavigationBar: TDLBottomNavBar(
              currentTab: index,
              onPressed: (idx) => _onPressed(context, idx),
            ),
          ),
        ),
      ),
    );
  }
}
