import 'package:flutter/material.dart';

import '../../models/meals.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: const Center(
        child: Text("Detalhes da refeição"),
      ),
    );
  }
}
