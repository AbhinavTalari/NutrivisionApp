import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final double duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final double calories;
  final double totalWeight;
  final String cuisineType;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.calories,
    @required this.totalWeight,
    @required this.cuisineType,
  });

  factory Meal.fromJson(Map<String, dynamic> data) {
    return Meal(
        id: data['uri'],
        title: data['label'],
        imageUrl: data['image'],
        ingredients: (data['ingredientLines'] as List).cast<String>(),
        steps: (data['healthLabels'] as List).cast<String>(),
        categories: (data['healthLabels'] as List).cast<String>(),
        complexity: Complexity.Simple,
        duration: data['totalTime'],
        affordability: Affordability.Affordable,
        isGlutenFree: false,
        isVegetarian: false,
        isVegan: false,
        isLactoseFree: false,
        calories: data['calories'],
        totalWeight: data['totalWeight'],
        cuisineType: data['cuisineType'][0]);
  }
}
