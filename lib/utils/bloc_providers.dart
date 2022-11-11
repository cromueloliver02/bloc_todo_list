import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';

class BlocsHandler {
  final List<BlocProvider> blocProviders = [
    BlocProvider(create: (ctx) => TodoListBloc()),
    BlocProvider(create: (ctx) => TodoSearchBloc()),
    BlocProvider(create: (ctx) => TodoFilterBloc()),
    BlocProvider(create: (ctx) => TabBloc()),
    BlocProvider(
      create: (ctx) => FavoriteTodosBloc(
        todoListBloc: ctx.read<TodoListBloc>(),
        initialFavoriteTodos: ctx
            .read<TodoListBloc>()
            .state
            .todos
            .where((d) => d.isFavorite)
            .toList(),
      ),
    ),
    BlocProvider(
      create: (ctx) => FilteredTodosBloc(
        todoFilterBloc: ctx.read<TodoFilterBloc>(),
        todoSearchBloc: ctx.read<TodoSearchBloc>(),
        todoListBloc: ctx.read<TodoListBloc>(),
        initialFilteredTodos: ctx.read<TodoListBloc>().state.todos,
      ),
    ),
  ];
}
