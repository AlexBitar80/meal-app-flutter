import 'package:flutter/material.dart';
import 'package:meals/pages/categories/categories_page.dart';
import 'package:meals/pages/categories/favorites_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedPageIndex = 0;
  final List<Map<String, Object>> _pages = const [
    {
      'title': 'Lista de Categorias',
      'page': CategoriesPage(),
    },
    {
      'title': 'Meus Favoritos',
      'page': FavoritesPage(),
    },
  ];

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
