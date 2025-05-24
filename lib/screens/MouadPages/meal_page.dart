import 'package:flutter/material.dart';
import '../../Components/MouadComponents/buttons.dart';
import '../../Components/MouadComponents/line.dart';
import '../../Components/MouadComponents/meal_list.dart';
import '../../Components/MouadComponents/search_bar.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  final List<Map<String, String>> allMeals = [
    {
      'title': 'Salade César',
      'type': 'Entrée',
      'image': 'assets/saladeCesar.png',
    },
    {'title': 'Pasta', 'type': 'Plat', 'image': 'assets/pasta.jpg'},
    {'title': 'Pizza', 'type': 'Plat', 'image': 'assets/pizza.jpg'},
    {'title': 'Tacos', 'type': 'Plat', 'image': 'assets/tacos.png'},
    {'title': 'Tiramisu', 'type': 'Dessert', 'image': 'assets/tiramisu.png'},
  ];

  List<Map<String, String>> filteredMeals = [];

  @override
  void initState() {
    super.initState();
    filteredMeals = List.from(allMeals); // Show all meals by default
  }

  void filterMeals(String category) {
    setState(() {
      filteredMeals =
          category == 'All'
              ? List.from(allMeals)
              : allMeals.where((meal) => meal['type'] == category).toList();
    });
  }

  void searchMeals(String query) {
    setState(() {
      filteredMeals =
          allMeals
              .where(
                (meal) =>
                    meal['title']!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBarWidget(
              hintText: 'Rechercher sur votre meal',
              onSearchPressed: searchMeals,
            ),
            SizedBox(height: 30),
            ButtonsFilter(onCategorySelected: filterMeals),
            SizedBox(height: 30),
            Line1(),
            SizedBox(height: 30),
            Expanded(child: MealList(meals: filteredMeals)),
            Line1(),
            SizedBox(height: 30),
            Button(title: 'Confirm', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
