import 'package:easy_meal/components/comment_item.dart';
import 'package:easy_meal/components/custom_meal_card.dart';
import 'package:easy_meal/components/filter_buttons.dart';
import 'package:easy_meal/components/meal_filter_buttons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _selectedFilterIndex = 0;
  final Map<String, dynamic> mealData = {
    'name': 'Pasta Carbonara',
    'image':
        'assets/pasta.jpg',
    'date': '21 Mar 2025',
    'rating': 4,
    'timesMade': 4,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //WavyHeader(),
              SizedBox(height: 7.h),
              FilterButtonsGroup(
                options: ["All", "Recent", "Filter", "Comment"],
                selectedIndex: _selectedFilterIndex,
                onSelected: (index) {
                  setState(() {
                    _selectedFilterIndex = index;
                  });
                },
              ),
              SizedBox(height: 3.h),
              CustomMealCard(
                mealData: mealData,
              ),
              SizedBox(height: 3.h),
              CommentItem(time: "12.5 PM", description: "hakim", content: 'uu', imagePath: '',),
              SizedBox(height: 3.h),
              MealFilterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
