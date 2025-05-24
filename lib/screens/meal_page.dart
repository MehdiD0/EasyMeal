import 'dart:typed_data';

import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MealPage extends StatelessWidget {
  final MealModel meal;

  MealPage({super.key, required this.meal});

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
            top: 40.h - 30,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name ?? 'No Name',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 1.5.h),
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
                          size: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      meal.description ?? 'No Description',
                      style: AppTheme.paragraphStyle,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Comment:',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.primaryColor,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(12.sp),
                      child: Text(
                        meal.comment ?? 'No Comment',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
