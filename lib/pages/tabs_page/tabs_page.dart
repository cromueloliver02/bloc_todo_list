import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../components/components.dart';
import '../../pages/pages.dart';
import '../../utils/functions.dart';
import '../../utils/constants.dart';

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
          bottomNavigationBar: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                BottomNavButton(
                  label: 'Home',
                  iconData: Icons.home,
                  isSelected: true,
                ),
                BottomNavButton(
                  label: 'Favorites',
                  iconData: Icons.favorite,
                  isSelected: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavButton extends StatelessWidget {
  const BottomNavButton({
    super.key,
    required this.label,
    required this.iconData,
    required this.isSelected,
  });

  final String label;
  final IconData iconData;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(
          iconData,
          size: 30,
          color: isSelected ? theme.colorScheme.primary : Colors.grey,
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: theme.textTheme.bodyText1!.copyWith(
            fontSize: kRegularFontSize,
            color: isSelected ? theme.colorScheme.primary : Colors.grey,
          ),
        ),
      ],
    );
  }
}
