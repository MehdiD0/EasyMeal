import 'dart:typed_data';

import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MealPage extends StatelessWidget {
  MealPage({super.key, required this.meal});
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 40.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    meal.image != null && meal.image!.isNotEmpty
                        ? Image.memory(
                          meal.image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text(
                                'Meal Image (Error loading)',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        )
                        : Container(
                          color: Colors.grey[300],
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              'Meal Image',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: SafeArea(
                        child: CircleAvatar(
                          backgroundColor: Colors.white70,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.black),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 40.h - 50,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.bgColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.name ?? 'No Name',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < (meal.rating ?? 0)
                                ? Icons.star
                                : Icons.star_border,
                            color:
                                index < (meal.rating ?? 0)
                                    ? Colors.amber
                                    : AppTheme.black,
                            size: 23.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Description :',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        meal.description ?? 'No Description',
                        style: AppTheme.paragraphStyle,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'Comment :',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.black, width: 1),
                        ),
                        padding: EdgeInsets.all(15.sp),
                        child: Text(
                          meal.comment ?? 'No Comment',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
