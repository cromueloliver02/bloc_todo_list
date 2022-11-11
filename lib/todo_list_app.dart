import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './pages/pages.dart';
import 'blocs/blocs.dart';
import 'utils/blocs_handler.dart';
import './utils/routes_handler.dart';
import './utils/themes_handler.dart';

class TodoListApp extends StatelessWidget {
  TodoListApp({super.key});

  final _blocsHandler = BlocsHandler();
  final _routesHandler = RoutesHandler();
  final _themesHandler = ThemesHandler();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocsHandler.blocProviders,
      child: BlocSelector<ThemeBloc, ThemeState, bool>(
        selector: (state) => state.isDark,
        builder: (ctx, isDark) => MaterialApp(
          title: 'Todo List',
          debugShowCheckedModeBanner: false,
          theme: _themesHandler.lightTheme,
          darkTheme: _themesHandler.darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          initialRoute: TabsPage.id,
          routes: _routesHandler.routes,
        ),
      ),
    );
  }
}
