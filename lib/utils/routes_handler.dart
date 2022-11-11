import 'package:flutter/cupertino.dart';
import '../pages/pages.dart';

class RoutesHandler {
  final Map<String, WidgetBuilder> routes = {
    TabsPage.id: (ctx) => const TabsPage(),
    HomePage.id: (ctx) => const HomePage(),
    FavoritesPage.id: (ctx) => const FavoritesPage(),
    ArchivePage.id: (ctx) => const ArchivePage(),
  };
}
