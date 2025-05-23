import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:easy_meal/models/meal_model.dart';
import 'package:http/http.dart' as http;

Future<Uint8List?> downlaodImageAsBytes(String url) async {
  try {
    final responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      return responce.bodyBytes;
    }
  } catch (e) {
    print('Erreur téléchargement image: $e');
  }
  return null;
}

Future<MealModel?> fetchRandomMealModel({required String type}) async {
  if (type == 'Dinner') {
    // Utiliser directement l’endpoint random
    const url = 'https://www.themealdb.com/api/json/v1/1/random.php';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final meal = data['meals'][0];

      Uint8List? imageBytes = await downlaodImageAsBytes(meal['strMealThumb']);

      return MealModel.fromMap({
        'name': meal['strMeal'],
        'description': meal['strInstructions'],
        'image': imageBytes,
        'comment': '',
        'type': 'Dinner',
        'rating': 0,
        'dateAdded': DateTime.now().toIso8601String(),
      });
    }
  } else if (type == 'Dessert') {
    final listRes = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert'));

    if (listRes.statusCode == 200) {
      final listData = jsonDecode(listRes.body);
      final desserts = listData['meals'];
      if (desserts.isEmpty) return null;

      // Étape 2 : Choisir un dessert aléatoire
      final randomDessert =
          desserts[Random().nextInt(desserts.length)];
      final mealId = randomDessert['idMeal'];

      // Étape 3 : Récupérer les détails
      final detailRes = await http.get(Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'));

      if (detailRes.statusCode == 200) {
        final detailData = jsonDecode(detailRes.body);
        final meal = detailData['meals'][0];

        Uint8List? imageBytes =
            await downlaodImageAsBytes(meal['strMealThumb']);

        return MealModel.fromMap({
          'name': meal['strMeal'],
          'description': meal['strInstructions'],
          'image': imageBytes,
          'comment': '',
          'type': 'Dessert',
          'rating': 0,
          'dateAdded': DateTime.now().toIso8601String(),
        });
      }
    }
  }

  return null;
}

