import 'package:easy_meal/components/comment_item.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommentVisuel extends StatelessWidget {
  final List<MealModel> meals;
  const CommentVisuel({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
            "No commment available",
            style: AppTheme.paragraphStyle.copyWith(fontSize: 15.sp),
          ),
        )
        : ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            return CommentItem(
              time: "", // Remplacer si tu as un champ date/time
              description: meal.description ?? "",
              content: meal.name ?? "",
              imagePath: meal.image ?? 'assets/image/icon.jpg',
            );
          },
        );
  }
}
