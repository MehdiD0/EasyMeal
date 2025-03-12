import 'package:easy_meal/models/meal_model.dart';

class DayModel {
  String? dayName;
  String? date;
  String? month;
  String? year;
  List<MealModel>? menu;

  DayModel({
    required this.dayName,
    required this.date,
    required this.month,
    required this.year,
    required this.menu,
  });

  // Constructor from a Map
  DayModel.fromMap(Map<String, dynamic> map){
    dayName = map['dayName'] ?? '';
    date = map['date'] ?? '';
    month = map['month'] ?? '';
    year = map['year'] ?? '';
    menu = (map['menu'] as List<dynamic>?) ?.map((item) => MealModel.fromMap(item as Map<String, dynamic>)).toList() ?? [];
  }
}
