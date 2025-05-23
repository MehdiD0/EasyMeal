import 'package:easy_meal/models/day_model.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:easy_meal/models/user_model.dart';
import 'package:hive/hive.dart';

class HiveServices {
  static const String userBoxName = "users";
  static const String mealBoxName = "meals";
  static const String dayMealBoxName = 'dayMeals';
  static const String authBoxName = "auth";
  static const String userKey = 'user';

  static Future<void> initHive() async {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(MealModelAdapter());
    Hive.registerAdapter(DayModelAdapter());

    await Hive.openBox<UserModel>(userBoxName);
    await Hive.openBox<MealModel>(mealBoxName);
    await Hive.openBox<DayModel>(dayMealBoxName);
    await Hive.openBox(authBoxName);
  }

  static Future<void> registerUser(UserModel user) async {
    final userBox = Hive.box<UserModel>(userBoxName);
    final authBox = Hive.box(authBoxName);
    await userBox.put(user.email, user);
    // Définir cet utilisateur comme utilisateur courant
    await authBox.put(userKey, user.email);
  }

  static Future<bool> loginUser(String email) async {
    final userBox = Hive.box<UserModel>(userBoxName);
    final authBox = Hive.box(authBoxName);

    final user = userBox.get(email);
    if (user != null) {
      await authBox.put(userKey, email);
      return true;
    }
    return false;
  }

  static UserModel? getCurrentUser() {
    final userBox = Hive.box<UserModel>(userBoxName);
    final authBox = Hive.box(authBoxName);

    String? currentUserEmail = authBox.get(userKey);
    if (currentUserEmail != null) {
      return userBox.get(currentUserEmail);
    }
    return null;
  }

  static bool isUserLogged() {
    final authBox = Hive.box(authBoxName);
    return authBox.containsKey(userKey); //ici
  }

  static Future<void> logoutUser() async {
    final authBox = Hive.box(authBoxName);
    await authBox.delete(userKey);
  }

  static Future<String> saveMeal(MealModel meal) async {
    final mealBox = Hive.box<MealModel>(mealBoxName);
    //un ID unique pour le repas
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    await mealBox.put(id, meal);
    return id;
  }

  static Future<void> updateMeal(String id, MealModel meal) async {
    final mealBox = Hive.box<MealModel>(mealBoxName);
    await mealBox.put(id, meal);
  }

  static MealModel? getMealById(String id) {
    final mealBox = Hive.box<MealModel>(mealBoxName);
    return mealBox.get(id);
  }

  static List<MealModel> getMealsByType(String type) {
    final mealBox = Hive.box<MealModel>(mealBoxName);
    return mealBox.values
        .where((meal) => meal.type?.toLowerCase() == type.toLowerCase())
        .toList();
  }

  static Future<void> deleteMeal(String id) async {
    final mealBox = Hive.box<MealModel>(mealBoxName);
    await mealBox.delete(id);
  }

  static List<MealModel> searchMealsByName(String query) {
    final mealBox = Hive.box<MealModel>(mealBoxName);
    return mealBox.values
        .where((meal) => meal.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  static List<MealModel> getAllMeals() {
    final mealBox = Hive.box<MealModel>(mealBoxName);
    return mealBox.values.toList();
  }

  static List<MealModel> getRecentMeals() {
    final mealBox = Hive.box<MealModel>(mealBoxName);

    final allMeals = mealBox.values.toList();
    allMeals.sort((a, b) => b.dateAdded!.compareTo(a.dateAdded!));
    return allMeals.take(5).toList();
  }
}
