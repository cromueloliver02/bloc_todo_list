import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../components/components.dart';
import '../../pages/pages.dart';
import '../../utils/functions.dart';

class TabsPage extends StatefulWidget {
  static const id = '/tabs';

  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final _screens = const [
    HomePage(),
    FavoritesPage(),
  ];
  var _currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: SafeArea(
        top: false,
        child: Scaffold(
          drawer: const TDLDrawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showTodoModal(context),
            child: const Icon(Icons.add),
          ),
          body: IndexedStack(
            index: _currentIdx,
            children: _screens,
          ),
          bottomNavigationBar: TDLBottomNavBar(
            currentIdx: _currentIdx,
            onPressed: (idx) => setState(() => _currentIdx = idx),
          ),
        ),
      ),
    );
  }
}
