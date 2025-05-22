import '../../Components/MouadComponents/buttons.dart';
import '../../Components/MouadComponents/line.dart';
import '../../Components/MouadComponents/meal_list.dart';
import '../../Components/MouadComponents/search_bar.dart';
import 'package:flutter/material.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<Map<String, String>> allMeals = [
    {
      'title': 'Salade César',
      'type': 'Entrée',
      'image': 'Assets/saladeCesar.png'
    },
    {'title': 'Pasta', 'type': 'Plat', 'image': 'assets/MouadPart/pasta.jpg'},
    {'title': 'Pizza', 'type': 'Plat', 'image': 'assets/MouadPart/pizza.jpg'},
    {'title': 'Tacos', 'type': 'Plat', 'image': 'assets/MouadPart/tacos.png'},
    {'title': 'Tiramisu', 'type': 'Dessert', 'image': 'assets/MouadPart/tiramisu.png'},
  ];

  List<Map<String, String>> filteredMeals = [];

  @override
  void initState() {
    super.initState();
    filteredMeals = List.from(allMeals); // Au départ, afficher tous les repas
  }

  void filterMeals(String category) {
    setState(() {
      if (category == 'All') {
        filteredMeals = List.from(allMeals);
      } else {
        filteredMeals =
            allMeals.where((meal) => meal['type'] == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onSearchPressed: (query) {
                setState(() {
                  filteredMeals = allMeals
                      .where((meal) => meal['title']!
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .toList();
                });
              },
            ),
            SizedBox(height: 30),
            ButtonsFilter(
                onCategorySelected: filterMeals), // 🔥 Lien avec le filtre
            SizedBox(height: 30),
            Line1(),
            SizedBox(height: 30),
            Expanded(child: MealList(meals: filteredMeals)),
            Line1(),
            SizedBox(height: 30),
            Button(
              title: 'Confirm',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
