import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/pages/categories/categories_page.dart';
import 'package:meals/pages/categories/favorites_page.dart';

import '../../components/main_drawer.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsPage({
    super.key,
    required this.favoriteMeals,
  });

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedPageIndex = 0;
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      {
        'title': 'Lista de Categorias',
        'page': const CategoriesPage(),
      },
      {
        'title': 'Meus Favoritos',
        'page': FavoritesPage(favoriteMeals: widget.favoriteMeals),
      },
    ];
  }

  _selectedIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: _selectedIndex,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
