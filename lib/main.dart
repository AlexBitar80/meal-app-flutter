import 'package:flutter/material.dart';
import 'package:meals/pages/categories/categories_meals_page.dart';
import 'package:meals/pages/meals/meal_detail_page.dart';
import 'package:meals/pages/settings/settings_page.dart';
import 'package:meals/pages/tabs/tabs_page.dart';
import 'package:meals/utils/routes/app_routes.dart';

import 'data/dummy_data.dart';
import 'models/meals.dart';
import 'models/settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: AppRoutes.home_page,
      routes: {
        AppRoutes.home_page: (context) => const TabsPage(),
        AppRoutes.categories_meals: (context) =>
            CategoriesMealsPage(meals: _availableMeals),
        AppRoutes.meal_detail: (context) => const MealDetailPage(),
        AppRoutes.settings_page: (context) =>
            SettingsPage(onSettingsChanged: _filterMeals),
      },
    );
  }
}
