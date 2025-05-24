import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:easy_meal/components/LinkText.dart';
import 'package:easy_meal/components/RatingCard.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AllMeals extends StatelessWidget {
  AllMeals({super.key});

  // Dummy meals – replace with data from Hive or DB later
  final Map<String, List<MealModel>> categorizedMeals = {
    'Entrées 🥗': [
      MealModel(name: 'Bruschetta', image: Uint8List(0)),
      MealModel(name: 'Caprese Salad', image: Uint8List(0)),
    ],
    'Plats 🍛': [
      MealModel(name: 'Grilled Salmon', image: Uint8List(0)),
      MealModel(name: 'Pasta Carbonara', image: Uint8List(0)),
    ],
    'Dessert 🍰': [
      MealModel(name: 'Tiramisu', image: Uint8List(0)),
      MealModel(name: 'Chocolate Cake', image: Uint8List(0)),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.h),
            ...categorizedMeals.entries.map((entry) {
              return _buildCategorySection(entry.key, entry.value, context);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(
    String title,
    List<MealModel> meals,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown,
                ),
              ),
              LinkText(
                text: 'Create',
                onTap: () {
                  // Navigate to Add Meal Screen
                  context.goNamed('addmeal');
                },
              ),
            ],
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 30.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  meals
                      .map(
                        (meal) => Padding(
                          padding: EdgeInsets.all(1.h),
                          child: RatingCard(meal: meal),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
