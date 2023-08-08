import 'package:flutter/material.dart';
import 'package:meals/models/category_model.dart';

class CategoriesMealsPage extends StatelessWidget {
  final Category category;

  const CategoriesMealsPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
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
