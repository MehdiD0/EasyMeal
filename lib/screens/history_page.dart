import 'package:easy_meal/components/filter_buttons.dart';
import 'package:easy_meal/components/search_bar.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/screens/history_meal_filter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController controller = TextEditingController();
  int _selectedFilterIndex = 0;
  final List<String> options = ["All", "Recent", "Filter", "Comments"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "History",
          style: AppTheme.titleStyle.copyWith(fontSize: 25.sp),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 3.h),
          CustomSearchBar(hintText: "Search your meal", controller:controller ,),
          SizedBox(height: 3.h),
          FilterButtonsGroup(
            options: options,
            selectedIndex: _selectedFilterIndex,
            onSelected: (index) {
              setState(() {
                _selectedFilterIndex = index;
              });
            },
          ),
          Expanded(child: SingleChildScrollView(child: Column(children: [
            if(_selectedFilterIndex==2)
              HistoryMealFilter()
            else Column(children: [SizedBox(height: 6.h,),Text("Rien Pour Momment",style: AppTheme.titleStyle.copyWith(color: AppTheme.black),)],)

          ],))),
        ],
      ),
    );
  }
}
