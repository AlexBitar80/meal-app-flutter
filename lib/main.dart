import 'package:flutter/material.dart';
import 'package:meals/pages/categories/categories_meals_page.dart';
import 'package:meals/pages/meals/meal_detail_page.dart';
import 'package:meals/pages/tabs/tabs_page.dart';
import 'package:meals/utils/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        AppRoutes.categories_meals: (context) => const CategoriesMealsPage(),
        AppRoutes.meal_detail: (context) => const MealDetailPage(),
      },
    );
  }
}
