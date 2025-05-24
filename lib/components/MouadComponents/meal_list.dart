import './meal_item.dart';
import 'package:flutter/material.dart';

class MealList extends StatelessWidget {
  final List<Map<String, String>> meals;

  const MealList({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return MealItem(
          title: meal['title'] ?? 'Unknown',
          type: meal['type'] ?? 'Unknown',
          imageUrl: meal['image'] ?? '',
        );
      },
    );
  }
}
