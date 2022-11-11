import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/blocs.dart';
import './filter_button.dart';

class TopActionBar extends StatelessWidget {
  const TopActionBar({super.key});

  void _onPressed(BuildContext ctx, Filter filter) =>
      ctx.read<TodoFilterBloc>().add(ChangeFilterEvent(filter: filter));

  @override
  Widget build(BuildContext context) {
    final filterButtons = ['All', 'Pending', 'Done'];

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
        BlocSelector<TodoFilterBloc, TodoFilterState, Filter>(
          selector: (state) => state.filter,
          builder: (ctx, filter) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              filterButtons.length,
              (idx) => FilterButton(
                title: filterButtons[idx],
                filter: Filter.values[idx],
                isCurrent: Filter.values[idx] == filter,
                onPressed: (filter) => _onPressed(ctx, filter),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
