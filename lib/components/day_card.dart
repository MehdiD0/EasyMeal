import 'package:flutter/material.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:sizer/sizer.dart';

class DayCard extends StatelessWidget {
  final String date;
  const DayCard({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    int dayNum = int.parse(date.split('-')[2]);
    int monthNum = int.parse(date.split('-')[1]);
    int year = int.parse(date.split('-')[0]);

    String month = months[monthNum - 1];
    String dayName = days[DateTime(year, monthNum, dayNum).weekday - 1];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
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
              style: AppTheme.titleStyle.copyWith(color: AppTheme.black)
            ),
            SizedBox(height: 1),
            Container(
              width: 80,
              height: 1,
              color: Colors.black,
            ),
            SizedBox(height: 8), // Space after line
            Text(
              "$dayNum $month",
              style: AppTheme.hintTextStyle.copyWith(fontSize: 15.sp)
            ),
          ],
        ),
      ),
    );
  }
}
