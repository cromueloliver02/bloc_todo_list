import 'package:flutter/material.dart';
import '../utils/constants.dart';

class TDLBottomNavBar extends StatelessWidget {
  const TDLBottomNavBar({
    super.key,
    required this.currentTab,
    required this.onPressed,
  });

  final int currentTab;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomNavButton(
            label: 'Home',
            iconData: Icons.home,
            tab: 0,
            currentTab: currentTab,
            onPressed: onPressed,
          ),
          _BottomNavButton(
            label: 'Favorites',
            iconData: Icons.favorite,
            tab: 1,
            currentTab: currentTab,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class _BottomNavButton extends StatelessWidget {
  const _BottomNavButton({
    Key? key,
    required this.label,
    required this.iconData,
    required this.tab,
    required this.currentTab,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final IconData iconData;
  final int tab;
  final int currentTab;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onPressed(tab),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: tab == currentTab ? kLightPrimaryColor : Colors.grey,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: kRegularFontSize,
              color: tab == currentTab ? kLightPrimaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
