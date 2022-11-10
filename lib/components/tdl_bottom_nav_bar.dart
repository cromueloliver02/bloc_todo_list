import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TDLBottomNavBar extends StatelessWidget {
  const TDLBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _BottomNavButton(
            label: 'Home',
            iconData: Icons.home,
            isSelected: true,
          ),
          _BottomNavButton(
            label: 'Favorites',
            iconData: Icons.favorite,
            isSelected: false,
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
    required this.isSelected,
  }) : super(key: key);

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
