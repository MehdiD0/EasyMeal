import 'package:easy_meal/components/buttons.dart';
import 'package:easy_meal/components/day_card.dart';
import 'package:easy_meal/components/dialog.dart';
import 'package:easy_meal/components/meal_card.dart';
import 'package:easy_meal/firbase_authentication/auth_services.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:easy_meal/screens/MouadPages/type_repas_page.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    List<String> dates = List.generate(7, (index) {
      DateTime newDate = today.add(Duration(days: index));
      return DateFormat('yyyy-MM-dd').format(newDate);
    });

    // List<MealModel> todayMeals = [
    //   MealModel(name: "Special", image: "assets/pasta.jpg"),
    //   MealModel(name: "KawKaw", image: "assets/pasta.jpg"),
    //   MealModel(name: "The", image: "assets/pasta.jpg"),
    //   MealModel(name: "Hakim", image: "assets/pasta.jpg"),
    // ];
    //changement de type si mehdi hada makan
    List<MealModel> todayMeals = [
      MealModel(name: "Special", image: Uint8List(0)),
      MealModel(name: "Special", image: Uint8List(0)),
      MealModel(name: "Special", image: Uint8List(0)),
      MealModel(name: "Special", image: Uint8List(0)),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.white,
        body: Column(
          children: [
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.all(3.w),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: DayCard(date: dates[index]),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Container(width: 100.w, height: 2, color: AppTheme.primaryColor),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("Today's meal :", style: AppTheme.titleStyle),
                ),
                PrimaryTextButton(
                  label: "Edit",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TypeRepasPage()),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(3.w),
              child: SizedBox(
                height: 28.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: todayMeals.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: MealCard(meal: todayMeals[index]),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Container(width: 100.w, height: 2, color: AppTheme.primaryColor),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Text("Meals of the week :", style: AppTheme.titleStyle),
              ),
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.picture_as_pdf,
                        color: AppTheme.primaryColor,
                        size: 40,
                      ),
                      Text(
                        "Export PDF",
                        style: AppTheme.titleStyle.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(Icons.image, color: AppTheme.primaryColor, size: 40),
                      Text(
                        "Export PNG",
                        style: AppTheme.titleStyle.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Container(width: 100.w, height: 2, color: AppTheme.primaryColor),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      Text(
                        "Home",
                        style: AppTheme.hintTextStyle.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(Icons.lunch_dining),
                      Text(
                        "Meals",
                        style: AppTheme.hintTextStyle.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.goNamed("history");
                  },
                  child: Column(
                    children: [
                      Icon(Icons.history),
                      Text(
                        "History",
                        style: AppTheme.hintTextStyle.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //AuthService().logout();
                    showDialog(
                      context: context,
                      builder: (BuildContext dialogContex) {
                        return CustomDialog.createDialog(
                          context: dialogContex,
                          title: "Log out of the app",
                          content: "Are you sure you want to log out?",
                          onConfirm: () {
                            AuthService().logout();
                          },
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.logout),
                      Text(
                        "Logout",
                        style: AppTheme.hintTextStyle.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
