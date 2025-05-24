import 'package:easy_meal/components/bottom_nav_bar.dart';
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
      backgroundColor: AppTheme.fillColor,
      bottomNavigationBar: BottomNavBar(currentIndex: 2), // Fixed nav bar

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "History",
                  style: AppTheme.titleStyle.copyWith(
                    fontSize: 25.sp,
                    fontWeight:
                        FontWeight.w800, // Stronger weight for professionalism
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SizedBox(height: 3.h),

              // Search Bar with themed hintStyle (assuming CustomSearchBar supports it)
              CustomSearchBar(
                hintText: "Search your meal",
                controller: controller,
                // Uncomment if your CustomSearchBar accepts a hintStyle param:
                // hintStyle: AppTheme.searchBarHintStyle,
              ),
              SizedBox(height: 3.h),

              // Filter Buttons with themed text style (depends on your FilterButtonsGroup implementation)
              FilterButtonsGroup(
                options: options,
                selectedIndex: _selectedFilterIndex,
                onSelected: (index) {
                  setState(() => _selectedFilterIndex = index);
                },
                // If your FilterButtonsGroup supports styling text, pass this:
                // textStyle: AppTheme.labelStyle.copyWith(
                //   fontWeight: FontWeight.w600,
                //   fontSize: 14.sp,
                // ),
              ),
              SizedBox(height: 2.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: _buildContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedFilterIndex) {
      case 1:
        return RecentMeals(meals: recentMeals);
      case 2:
        return HistoryMealFilter();
      case 3:
        return CommentVisuel(meals: meals);
      default:
        return AllHistoryMeals(meals: meals);
    }
  }
}
