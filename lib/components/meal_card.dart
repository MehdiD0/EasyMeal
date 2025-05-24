import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class MealCard extends StatelessWidget {
  final MealModel meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed("meal", extra: meal);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Meal Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:
                meal.image != null
                    ? Image.memory(meal.image!, fit: BoxFit.cover)
                    : Image.asset(
                      "assets/pasta.jpg",
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
          ),
          SizedBox(height: 8),
          // Meal Title
          SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              meal.name ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Rating Bar
          RatingBar.builder(
            initialRating: meal.getRating().toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 28,
            itemPadding: EdgeInsets.symmetric(horizontal: 1),
            itemBuilder:
                (context, _) => Icon(Icons.star, color: AppTheme.primaryColor),
            onRatingUpdate: (rating) {
              //! Update rating
            },
          ),
        ],
      ),
    );
  }
}
