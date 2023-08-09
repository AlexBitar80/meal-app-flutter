import 'package:flutter/material.dart';
import 'package:meals/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   Platform.isIOS
    //       ? CupertinoPageRoute(
    //           builder: (_) => CategoriesMealsPage(category: category),
    //         )
    //       : MaterialPageRoute(
    //           builder: (_) => CategoriesMealsPage(category: category),
    //         ),
    // );

    Navigator.of(context).pushNamed(
      'categories-meals',
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
