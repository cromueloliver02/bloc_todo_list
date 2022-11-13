import '../blocs/blocs.dart';

class BlocsHandler {
  final List<BlocProvider> blocProviders = [
    BlocProvider<TodoListBloc>(create: (ctx) => TodoListBloc()),
    BlocProvider<TodoSearchBloc>(create: (ctx) => TodoSearchBloc()),
    BlocProvider<TodoFilterBloc>(create: (ctx) => TodoFilterBloc()),
    BlocProvider<TabBloc>(create: (ctx) => TabBloc()),
    BlocProvider<ThemeBloc>(create: (ctx) => ThemeBloc()),
    BlocProvider<FavoriteTodosBloc>(
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
    BlocProvider<TodoCountBloc>(
      create: (ctx) => TodoCountBloc(
        todoListBloc: ctx.read<TodoListBloc>(),
        initialAllCount: ctx.read<TodoListBloc>().state.todos.length,
        initialPendingCount:
            ctx.read<TodoListBloc>().state.todos.where((d) => !d.isDone).length,
        initialDoneCount:
            ctx.read<TodoListBloc>().state.todos.where((d) => d.isDone).length,
      ),
    ),
    BlocProvider<FilteredTodosBloc>(
      create: (ctx) => FilteredTodosBloc(
        todoFilterBloc: ctx.read<TodoFilterBloc>(),
        todoSearchBloc: ctx.read<TodoSearchBloc>(),
        todoListBloc: ctx.read<TodoListBloc>(),
        initialFilteredTodos: ctx.read<TodoListBloc>().state.todos,
      ),
    ),
  ];
}
