import 'dart:typed_data';

import 'package:easy_meal/components/bottom_nav_bar.dart';
import 'package:easy_meal/components/buttons.dart';
import 'package:easy_meal/components/day_card.dart';
import 'package:easy_meal/components/meal_card.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:easy_meal/screens/MouadPages/type_repas_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final dates = List.generate(
      7,
      (i) => DateFormat('yyyy-MM-dd').format(today.add(Duration(days: i))),
    );
    final todayMeals = List.generate(
      4,
      (_) => MealModel(name: "Special", image: Uint8List(0)),
    );

    return Scaffold(
      backgroundColor: AppTheme.white,
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Optional Page Title
              // Center(
              //   child: Text(
              //     "Home",
              //     style: TextStyle(
              //       fontSize: 28.sp,
              //       fontWeight: FontWeight.bold,
              //       fontStyle: FontStyle.italic,
              //       color: AppTheme.primaryColor,
              //     ),
              //   ),
              // ),
              SizedBox(height: 2.h),

              // Date Picker Horizontal List
              SizedBox(
                height: 10.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  separatorBuilder: (_, __) => SizedBox(width: 3.w),
                  itemBuilder:
                      (ctx, i) => DayCard(
                        date: dates[i],
                        isSelected: dates[i] == selectedDate,
                        onTap: () {
                          setState(() {
                            selectedDate = dates[i];
                          });
                        },
                      ),
                ),
              ),

              SizedBox(height: 2.h),
              Divider(color: AppTheme.primaryColor, thickness: 2),

              // Today's Meals Header
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's meal:", style: AppTheme.titleStyle),
                    PrimaryTextButton(
                      label: "Edit",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TypeRepasPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Today's Meals Cards Horizontal List
              SizedBox(
                height: 28.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: todayMeals.length,
                  separatorBuilder: (_, __) => SizedBox(width: 5.w),
                  itemBuilder: (ctx, i) => MealCard(meal: todayMeals[i]),
                ),
              ),

              SizedBox(height: 2.h),
              Divider(color: AppTheme.primaryColor, thickness: 2),

              // Weekly Export Title
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                child: Text("Meals of the week:", style: AppTheme.titleStyle),
              ),

              // Export Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildExportButton(Icons.picture_as_pdf, "Export PDF"),
                  _buildExportButton(Icons.image, "Export PNG"),
                ],
              ),

              SizedBox(height: 4.h),
              Divider(color: AppTheme.primaryColor, thickness: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExportButton(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 40),
          SizedBox(height: 1.h),
          Text(
            label,
            style: AppTheme.titleStyle.copyWith(fontSize: 11.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
