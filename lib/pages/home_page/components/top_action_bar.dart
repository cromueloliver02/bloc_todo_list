import 'package:flutter/material.dart';
import '../../../blocs/blocs.dart';
import './filter_button.dart';

class TopActionBar extends StatefulWidget {
  const TopActionBar({super.key});

  @override
  State<TopActionBar> createState() => _TopActionBarState();
}

class _TopActionBarState extends State<TopActionBar> {
  late final TextEditingController _searchController;

  void _onSearch(BuildContext ctx, String keywords) =>
      ctx.read<TodoSearchBloc>().add(SearchTodoEvent(keywords: keywords));

  void _onFilter(BuildContext ctx, Filter filter) =>
      ctx.read<TodoFilterBloc>().add(ChangeFilterEvent(filter: filter));

  void _onClearText(BuildContext ctx) {
    _onSearch(ctx, '');
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Material(
          child: BlocSelector<TodoSearchBloc, TodoSearchState, String>(
            selector: (state) => state.keywords,
            builder: (ctx, keywords) => TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search todos',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: keywords.isNotEmpty
                    ? GestureDetector(
                        onTap: () => _onClearText(context),
                        child: const Icon(Icons.clear),
                      )
                    : null,
              ),
              onChanged: (keywords) => _onSearch(context, keywords),
            ),
          ),
        ),
        const SizedBox(height: 10),
        BlocSelector<TodoFilterBloc, TodoFilterState, Filter>(
          selector: (state) => state.filter,
          builder: (ctx, filter) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              Filter.values.length,
              (idx) => FilterButton(
                title: Filter.values[idx].name.toUpperCase(),
                filter: Filter.values[idx],
                isCurrent: Filter.values[idx] == filter,
                onPressed: (filter) => _onFilter(ctx, filter),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
