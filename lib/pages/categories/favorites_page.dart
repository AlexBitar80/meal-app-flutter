import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';

import '../../models/meals.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesPage({
    super.key,
    required this.favoriteMeals,
  });

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: favoriteMeals[index]);
        },
      );
    }
  }
}
