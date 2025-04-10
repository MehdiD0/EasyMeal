class MealModel {
  String? name;
  String? image;
  String? description;
  String? comment;
  String? type;
  int? rating;

  // Default constructor :
  MealModel({
    required this.name,
    required this.image,
  });

  // Constructor from map :
  MealModel.fromMap(Map<String, dynamic> map) {
    name = map['name'] ?? '';
    image = map['image'] ?? '';
    description = map['description'] ?? '';
    comment = map['comment'] ?? '';
    type = map['type'] ?? '';
    rating = (map['rating'] is int) ? map['rating'] as int : 0;
  }

  // Setters :
  void setName(String name) {
    this.name = name;
  }
  void setImage(String image) {
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
  String getImage() {
    return image ?? '';
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