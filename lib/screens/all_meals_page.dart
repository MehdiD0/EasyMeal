import 'dart:typed_data';
import 'package:easy_meal/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:easy_meal/components/LinkText.dart';
import 'package:easy_meal/components/RatingCard.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class AllMeals extends StatelessWidget {
  AllMeals({super.key});

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
      backgroundColor: AppTheme.white,
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Meals",
                  style: AppTheme.titleStyle.copyWith(
                    fontSize: 26.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              ...categorizedMeals.entries.map(
                (entry) =>
                    _buildCategorySection(entry.key, entry.value, context),
              ),
              SizedBox(height: 1.h),
            ],
          ),
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
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTheme.labelStyle.copyWith(
                  fontSize: 20.sp,
                  color: AppTheme.darkGrey,
                ),
              ),
              LinkText(text: 'Create', onTap: () => context.goNamed('addmeal')),
            ],
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 30.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: meals.length,
              separatorBuilder: (_, __) => SizedBox(width: 3.w),
              itemBuilder:
                  (context, i) => Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: RatingCard(meal: meals[i]),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
