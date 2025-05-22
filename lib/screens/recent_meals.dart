import 'package:easy_meal/components/meal_card.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RecentMeals extends StatelessWidget {
  final List<MealModel> meals;
  const RecentMeals({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
            "No meals found",
            style: AppTheme.paragraphStyle.copyWith(fontSize: 15.sp),
          ),
        )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return MealCard(meal: meals[index]);
            },
          );
  }
}
