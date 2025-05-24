import 'package:easy_meal/components/dialog.dart';
import 'package:easy_meal/firbase_authentication/auth_services.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            context.goNamed("home");
          },
          child: Column(
            children: [
              Icon(
                Icons.home,
                color: currentIndex == 0 ? AppTheme.primaryColor : Colors.grey,
              ),
              Text(
                "Home",
                style: AppTheme.hintTextStyle.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      currentIndex == 0 ? AppTheme.primaryColor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            context.goNamed("allmeals");
          },
          child: Column(
            children: [
              Icon(
                Icons.lunch_dining,
                color: currentIndex == 1 ? AppTheme.primaryColor : Colors.grey,
              ),
              Text(
                "Meals",
                style: AppTheme.hintTextStyle.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      currentIndex == 1 ? AppTheme.primaryColor : Colors.grey,
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
              Icon(
                Icons.history,
                color: currentIndex == 2 ? AppTheme.primaryColor : Colors.grey,
              ),
              Text(
                "History",
                style: AppTheme.hintTextStyle.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      currentIndex == 2 ? AppTheme.primaryColor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            context.goNamed("profile");
          },
          child: Column(
            children: [
              Icon(
                Icons.person,
                color: currentIndex == 3 ? AppTheme.primaryColor : Colors.grey,
              ),
              Text(
                "Profile",
                style: AppTheme.hintTextStyle.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      currentIndex == 3 ? AppTheme.primaryColor : Colors.grey,
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
              Icon(Icons.logout, color: Colors.red),
              Text(
                "Logout",
                style: AppTheme.hintTextStyle.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
