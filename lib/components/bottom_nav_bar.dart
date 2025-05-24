import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(context, Icons.home, "Home", 0, "home"),
          _buildNavItem(context, Icons.lunch_dining, "Meals", 1, "allmeals"),
          _buildNavItem(context, Icons.history, "History", 2, "history"),
          _buildNavItem(context, Icons.person, "Profile", 3, "profile"),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
    String route,
  ) {
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () {
        if (!isSelected) {
          context.goNamed(route);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? AppTheme.primaryColor : Colors.grey),
          Text(
            label,
            style: AppTheme.hintTextStyle.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? AppTheme.primaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
