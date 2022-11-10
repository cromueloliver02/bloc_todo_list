import 'package:flutter/material.dart';
import './pages/pages.dart';
import './utils/tdl_theme.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
