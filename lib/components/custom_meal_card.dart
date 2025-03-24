import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_meal/helpers/app_theme.dart';

class CustomMealCard extends StatelessWidget {
  final Map<String, dynamic> mealData;
  const CustomMealCard({super.key, required this.mealData});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final imageWidth = orientation == Orientation.portrait ? 25.w : 30.w;
    final imageHeight = orientation == Orientation.portrait ? 20.h : 20.w;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40), // = 40/255
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: Image.asset(mealData['image'], fit: BoxFit.cover),
            ),
            //clipBehavior: Clip.hardEdge,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mealData['name'],
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'View more',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Last served: ${mealData['date']}',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppTheme.accentColor,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    '${mealData['timesMade']} times made',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppTheme.accentColor,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // Évaluation par étoiles
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < mealData['rating']
                            ? Icons.star
                            : Icons.star_border,
                        color: AppTheme.amber,
                        size: 17,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Add to menu',
                          style: TextStyle(color: AppTheme.white, fontSize: 12),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
