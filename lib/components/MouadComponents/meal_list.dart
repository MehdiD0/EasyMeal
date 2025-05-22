import './meal_item.dart';
import 'package:flutter/material.dart';

class MealList extends StatelessWidget {
  final List<Map<String, String>> meals;

  MealList({required this.meals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealItem(
          title: meals[index]['title']!,
          type: meals[index]['type']!,
          imageUrl: meals[index]['image']!,
        );
      },
    );
  }
}
