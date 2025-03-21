import 'package:easy_meal/components/buttons.dart';
import 'package:easy_meal/components/meal_card.dart';
import 'package:easy_meal/components/snackbar.dart';
import 'package:easy_meal/components/text_field.dart';
import 'package:easy_meal/components/wavy_header.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children:[
          WavyHeader(),
          MealCard()
        ] 
      ),
    );
  }
}