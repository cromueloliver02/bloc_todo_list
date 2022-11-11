import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './pages/pages.dart';
import '../utils/bloc_providers.dart';
import './utils/tdl_theme.dart';

class TodoListApp extends StatelessWidget {
  TodoListApp({super.key});

  final _blocsHandler = BlocsHandler();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocsHandler.blocProviders,
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
