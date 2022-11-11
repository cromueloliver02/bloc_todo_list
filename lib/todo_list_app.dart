import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/blocs.dart';
import './pages/pages.dart';
import './utils/tdl_theme.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => TodoListBloc()),
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
        BlocProvider(create: (ctx) => TodoSearchBloc()),
        BlocProvider(create: (ctx) => TodoFilterBloc()),
        BlocProvider(
          create: (ctx) => FilteredTodosBloc(
            todoFilterBloc: ctx.read<TodoFilterBloc>(),
            todoListBloc: ctx.read<TodoListBloc>(),
            initialFilteredTodos: ctx.read<TodoListBloc>().state.todos,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Todo List',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        // themeMode: ThemeMode.dark,
        initialRoute: TabsPage.id,
        routes: {
          TabsPage.id: (ctx) => const TabsPage(),
          HomePage.id: (ctx) => const HomePage(),
          FavoritesPage.id: (ctx) => const FavoritesPage(),
          ArchivePage.id: (ctx) => const ArchivePage(),
        },
      ),
    );
  }
}
