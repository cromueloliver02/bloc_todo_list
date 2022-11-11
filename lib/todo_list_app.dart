import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/blocs.dart';
import './pages/pages.dart';
import './utils/routes_handler.dart';
import './utils/themes_handler.dart';

class TodoListApp extends StatelessWidget {
  TodoListApp({super.key});

  final _routesHandler = RoutesHandler();
  final _themesHandler = ThemesHandler();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
      ],
      child: MaterialApp(
        title: 'Todo List',
        debugShowCheckedModeBanner: false,
        theme: _themesHandler.lightTheme,
        darkTheme: _themesHandler.darkTheme,
        themeMode: ThemeMode.light,
        // themeMode: ThemeMode.dark,
        initialRoute: TabsPage.id,
        routes: _routesHandler.routes,
      ),
    );
  }
}
