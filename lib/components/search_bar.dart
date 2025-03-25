import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onSunbmitted;
  final Function(String)? onChanged;
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    this.onSunbmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final sizedBoxHeight = orientation == Orientation.portrait ? 6.5.h : 16.h;
    return SizedBox(
      height: sizedBoxHeight,
      width: 90.w,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppTheme.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller,
          onSubmitted: onSunbmitted,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTheme.searchBarHintStyle,
            border: InputBorder.none,
            suffixIcon: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  if (onSunbmitted != null) {
                    onSunbmitted!(controller.text);
                  }
                },
                icon: Icon(Icons.search, color: AppTheme.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
