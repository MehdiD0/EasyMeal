import 'dart:typed_data';

import 'package:hive_flutter/adapters.dart';

part 'meal_model.g.dart';
@HiveType(typeId: 2)
class MealModel {
  @HiveField(0)
  String? name;
  @HiveField(1) 
  Uint8List? image;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? comment;
  @HiveField(4)
  String? type;
  @HiveField(5)
  int? rating;
  @HiveField(6)
  DateTime? dateAdded;

  // Default constructor :
  MealModel({required this.name, required this.image});

  // Constructor from map :
  MealModel.fromMap(Map<String, dynamic> map) {
    name = map['name'] ?? '';
    image = map['image'] != null ? Uint8List.fromList(List<int>.from(map['image'])):null;
    description = map['description'] ?? '';
    comment = map['comment'] ?? '';
    type = map['type'] ?? '';
    rating = (map['rating'] is int) ? map['rating'] as int : 0;
    dateAdded = map['dateAdded'] != null ? DateTime.parse(map['dateAdded']) : null;
  }

  // Setters :
  void setName(String name) {
    this.name = name;
  }

  void setImage(Uint8List image) {
    this.image = image;
  }

  void setComment(String comment) {
    this.comment = comment;
  }

  void setDescription(String description) {
    this.description = description;
  }

  void setRating(int rating) {
    this.rating = rating;
  }

  void setType(String type) {
    this.type = type;
  }

  // Getters :
  String getName() {
    return name ?? '';
  }

  Uint8List? getImage() {
    return image;
  }

  String getComment() {
    return comment ?? '';
  }

  String getDescription() {
    return description ?? '';
  }

  String getType() {
    return type ?? '';
  }

  int getRating() {
    return rating ?? 0;
  }
}
