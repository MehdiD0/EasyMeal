import 'package:easy_meal/components/meal_filter_buttons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HistoryMealFilter extends StatefulWidget {
  const HistoryMealFilter({super.key});

  @override
  State<HistoryMealFilter> createState() => _HistoryMealFilterState();
}

class _HistoryMealFilterState extends State<HistoryMealFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(height: 6.h,),MealFilterButtons()],
    );
  }
}