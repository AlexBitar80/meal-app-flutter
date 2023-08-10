import 'package:flutter/material.dart';
import 'package:meals/models/category_model.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Receitas por categoria ${category.id}'),
      ),
    );
  }
}
