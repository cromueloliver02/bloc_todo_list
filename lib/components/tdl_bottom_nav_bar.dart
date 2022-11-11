import 'package:flutter/material.dart';
import '../utils/constants.dart';

class TDLBottomNavBar extends StatelessWidget {
  const TDLBottomNavBar({
    super.key,
    required this.currentIdx,
    required this.onPressed,
  });

  final int currentIdx;
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
            index: 0,
            currentIdx: currentIdx,
            onPressed: onPressed,
          ),
          _BottomNavButton(
            label: 'Favorites',
            iconData: Icons.favorite,
            index: 1,
            currentIdx: currentIdx,
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
    required this.index,
    required this.currentIdx,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final IconData iconData;
  final int index;
  final int currentIdx;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onPressed(index),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: index == currentIdx ? kLightPrimaryColor : Colors.grey,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: kRegularFontSize,
              color: index == currentIdx ? kLightPrimaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
