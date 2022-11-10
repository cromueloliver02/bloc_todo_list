import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
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
        child: Scaffold(
          drawer: const TDLDrawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showTodoModal(context),
            child: const Icon(Icons.add),
          ),
          body: IndexedStack(
            index: 0,
            children: _screens,
          ),
          bottomNavigationBar: const TDLBottomNavBar(),
        ),
      ),
    );
  }
}
