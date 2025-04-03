import 'package:easy_meal/components/comment_item.dart';
import 'package:easy_meal/components/custom_meal_card.dart';
import 'package:easy_meal/components/filter_buttons.dart';
import 'package:easy_meal/components/meal_card.dart';
import 'package:easy_meal/components/meal_filter_buttons.dart';
import 'package:easy_meal/components/wavy_header.dart';
import 'package:easy_meal/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreen()
            ],
          ),
        ),
      ),
    );
  }
}
