import 'package:easy_meal/helpers/app_theme.dart';
import '../../Components/MouadComponents/cards.dart';
import '../../Components/MouadComponents/line.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TypeRepasPage extends StatelessWidget {
  const TypeRepasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3.h),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 4.h, // responsive size
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Repas",
                    style: AppTheme.titleStyle.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: AppTheme.primaryColor,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Line1(),
              SizedBox(height: 15.h),
              RepasCard(
                title: "Dejeuner",
                imageUrl: "assets/dejeuner.png",
                onTap: () {
                  print("Dejeuner sélectionné");
                },
              ),
              SizedBox(height: 7.h),
              RepasCard(
                title: "Diner",
                imageUrl: "assets/diner.jpg",
                onTap: () {
                  print("Diner sélectionné");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
