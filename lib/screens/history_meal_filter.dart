import 'package:easy_meal/components/custom_meal_card.dart';
import 'package:easy_meal/components/meal_filter_buttons.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/local_storage_management/hive_services.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HistoryMealFilter extends StatefulWidget {
  const HistoryMealFilter({super.key});

  @override
  State<HistoryMealFilter> createState() => _HistoryMealFilterState();
}

class _HistoryMealFilterState extends State<HistoryMealFilter> {
  String _selectedFilter = 'Desset';
  List<MealModel> _filteredMeals = [];
  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  void _handleFilterChange(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
    _loadMeals();
  }

  void _loadMeals() {
    final meals = HiveServices.getMealsByType(_selectedFilter);
    setState(() {
      _filteredMeals = meals;
    });
  }

@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 6.h),
          MealFilterButtons(onCategorySelected: _handleFilterChange),
          SizedBox(height: 2.h),
          _filteredMeals.isEmpty
              ? Container(
                height: 20.h,
                child: Center(
                  child: Text("No meals found for $_selectedFilter",style: AppTheme.paragraphStyle.copyWith(fontSize: 15.sp),),
                ),
              )
              : ListView.builder(
                shrinkWrap:
                    true, // Permet au ListView de prendre seulement l'espace nécessaire
                physics:
                    NeverScrollableScrollPhysics(), // Désactive le scroll du ListView
                itemCount: _filteredMeals.length,
                itemBuilder: (context, index) {
                  final meal = _filteredMeals[index];
                  return CustomMealCard(
                    mealData: {
                      'image': meal.image ?? 'assets/image/icon.jpg',
                      'name': meal.name ?? '',
                      'date': meal.dateAdded??'Unknown',
                      'timesMade': 0,
                      'rating': 0,
                    },
                  );
                },
              ),
        ],
      ),
    );
  }
}