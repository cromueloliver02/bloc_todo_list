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
      routes: {
        HomePage.id: (ctx) => const HomePage(),
        ArchivePage.id: (ctx) => const ArchivePage(),
      },
    );
  }
}
