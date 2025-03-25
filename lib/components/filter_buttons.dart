import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilterButtonsGroup extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final Function(int) onSelected;
  const FilterButtonsGroup({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final containerHeight = orientation == Orientation.portrait ? 5.h : 12.h;
    return Container(
      height: containerHeight,
      margin: EdgeInsets.symmetric(
        horizontal: orientation == Orientation.portrait ? 14 : 20,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          final horizantalPadding =
              orientation == Orientation.portrait ? 2.8.h : 14.7.h;
          final verticalPadding =
              orientation == Orientation.portrait ? 0.2.w : 2.w;

          return GestureDetector(
            onTap: () => onSelected(index),
            child: Container(
              margin: EdgeInsets.only(
                right: orientation == Orientation.portrait ? 1.h : 10.h,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizantalPadding,
                vertical: verticalPadding,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.secondaryColor : AppTheme.bgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  options[index],
                  style: TextStyle(
                    color: isSelected ? AppTheme.white : AppTheme.primaryColor,
                    fontSize:
                        orientation == Orientation.portrait ? 15.sp : 16.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
