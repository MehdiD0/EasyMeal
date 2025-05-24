import 'package:easy_meal/components/filter_buttons.dart';
import 'package:easy_meal/components/search_bar.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/local_storage_management/hive_services.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:easy_meal/screens/historical/all_history_meals.dart';
import 'package:easy_meal/screens/historical/comments_visuel.dart';
import 'package:easy_meal/screens/historical/history_meal_filter.dart';
import 'package:easy_meal/screens/recent_meals.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController controller = TextEditingController();
  int _selectedFilterIndex = 0;
  final List<String> options = ["All", "Recent", "Filter", "Comments"];
  final List<MealModel> meals = HiveServices.getAllMeals();
  final List<MealModel> recentMeals = HiveServices.getRecentMeals();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "History",
          style: AppTheme.titleStyle.copyWith(fontSize: 25.sp),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 3.h),
          CustomSearchBar(hintText: "Search your meal", controller: controller),
          SizedBox(height: 3.h),
          FilterButtonsGroup(
            options: options,
            selectedIndex: _selectedFilterIndex,
            onSelected: (index) {
              setState(() {
                _selectedFilterIndex = index;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (_selectedFilterIndex == 2)
                    HistoryMealFilter()
                  else if (_selectedFilterIndex == 3)
                    CommentVisuel(meals: meals)
                  else if (_selectedFilterIndex == 1)
                    RecentMeals(meals: recentMeals,)
                  else AllHistoryMeals(meals: meals)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
