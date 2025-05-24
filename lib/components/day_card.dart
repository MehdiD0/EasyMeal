import 'package:flutter/material.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:sizer/sizer.dart';

class DayCard extends StatelessWidget {
  final String date;
  final bool isSelected;
  final VoidCallback? onTap;

  const DayCard({
    super.key,
    required this.date,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    int dayNum = int.parse(date.split('-')[2]);
    int monthNum = int.parse(date.split('-')[1]);
    int year = int.parse(date.split('-')[0]);

    String month = months[monthNum - 1];
    String dayName = days[DateTime(year, monthNum, dayNum).weekday - 1];

    // Determine background color
    final bgColor = isSelected ? AppTheme.primaryColor : AppTheme.white;
    final textColor = isSelected ? AppTheme.white : AppTheme.black;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dayName,
                style: AppTheme.titleStyle.copyWith(color: textColor),
              ),
              SizedBox(height: 1),
              Container(width: 80, height: 1, color: textColor),
              SizedBox(height: 8),
              Text(
                "$dayNum $month",
                style: AppTheme.hintTextStyle.copyWith(
                  fontSize: 15.sp,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
