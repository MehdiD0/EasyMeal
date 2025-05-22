import 'package:easy_meal/models/meal_model.dart';
import 'package:hive/hive.dart';
part 'day_model.g.dart';

@HiveType(typeId: 1)
class DayModel extends HiveObject {
  @HiveField(0)
  String? dayName;
  @HiveField(1)
  String? date;
  @HiveField(2)
  String? month;
  @HiveField(3)
  String? year;
  @HiveField(4)
  List<MealModel>? menu;

  DayModel({
    required this.dayName,
    required this.date,
    required this.month,
    required this.year,
    required this.menu,
  });

  // Constructor from a Map
  DayModel.fromMap(Map<String, dynamic> map) {
    dayName = map['dayName'] ?? '';
    date = map['date'] ?? '';
    month = map['month'] ?? '';
    year = map['year'] ?? '';
    menu =
        (map['menu'] as List<dynamic>?)
            ?.map((item) => MealModel.fromMap(item as Map<String, dynamic>))
            .toList() ??
        [];
  }
}
