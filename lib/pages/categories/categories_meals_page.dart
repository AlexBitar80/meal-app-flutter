import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category_model.dart';

import '../../models/meals.dart';

class CategoriesMealsPage extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsPage({
    super.key,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(meal: categoryMeals[index]);
          },
        ),
      ),
    );
  }
}
