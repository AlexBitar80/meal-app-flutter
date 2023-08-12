enum Complexity {
  simple,
  challenging,
  hard,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final Cost cost;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.complexity,
    required this.cost,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.challenging:
        return 'Normal';
      case Complexity.hard:
        return 'Muito Dificil';
      case Complexity.medium:
        return 'Medio';
      case Complexity.difficult:
        return 'Dificil';
      default:
        return 'Desconhecido';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Barato';
      case Cost.fair:
        return 'Justo';
      case Cost.expensive:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }
}
