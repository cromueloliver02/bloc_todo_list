import 'package:flutter/material.dart';

class TopActionBar extends StatelessWidget {
  const TopActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const SizedBox(height: 10),
        const Material(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search todos',
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.clear),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'All',
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.primaryColorLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Pending',
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Done',
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
