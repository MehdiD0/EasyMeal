import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:easy_meal/components/LinkText.dart';
import 'package:easy_meal/components/RatingCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FoodRatingPage extends StatelessWidget {
  FoodRatingPage({Key? key}) : super(key: key);

  // Dummy meals – replace with data from Hive or DB later
  final Map<String, List<MealModel>> categorizedMeals = {
    'Entrées 🥗': [
      MealModel(
        name: 'Bruschetta',
        image: Uint8List.fromList(Image.asset('assets/Bruschetta.jpg') as List<int>), // Replace with Uint8List.fromList(...) if available
        //rating: 4,
      ),
      MealModel(name: 'Caprese Salad', image: Uint8List.fromList(Image.asset('assets/Caprese Salad.jpg') as List<int>), 
      //rating: 4
      ),
    ],
    'Plats 🍛': [
      MealModel(name: 'Grilled Salmon', image: Uint8List.fromList(Image.asset('assets/Grilled Salmon.jpg') as List<int>), 
      //rating: 3
      ),
      MealModel(name: 'Pasta Carbonara', image: Uint8List.fromList(Image.asset('assets/Pasta Carbonara.jpg') as List<int>), 
      //rating: 5
      ),
    ],
    'Dessert 🍰': [
      MealModel(name: 'Tiramisu', image: Uint8List.fromList(Image.asset('assets/Tiramisu.jpg') as List<int>),
      //rating: 4
      ),
      MealModel(name: 'Chocolate Cake', image: Uint8List.fromList(Image.asset('assets/Chocolate Cake.jpg') as List<int>),
      //rating: 5
      ),
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
              return _buildCategorySection(entry.key, entry.value);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String title, List<MealModel> meals) {
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
                text: 'View All',
                onTap: () {
                  // TODO: navigate to full list screen
                },
              ),
            ],
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 30.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: meals
                  .map((meal) => Padding(
                        padding: EdgeInsets.all(1.h),
                        child: RatingCard(meal: meal),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

