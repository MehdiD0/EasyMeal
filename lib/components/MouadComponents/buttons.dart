import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  Button({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270, // Largeur du bouton
      height: 45, // Hauteur du bouton
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFF914C), // Couleur orange FF914C
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white, // Texte en blanc
            fontWeight: FontWeight.bold, // Texte en gras
            fontSize: 16, // Taille de texte ajustée
          ),
        ),
      ),
    );
  }
}



class ButtonsFilter extends StatefulWidget {
  final Function(String) onCategorySelected;

  ButtonsFilter({required this.onCategorySelected});

  @override
  _ButtonsFilterState createState() => _ButtonsFilterState();
}

class _ButtonsFilterState extends State<ButtonsFilter> {
  String selectedCategory = 'All'; // Par défaut, "All" est sélectionné

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFilterButton('All'),
        _buildFilterButton('Entrée'),
        _buildFilterButton('Plat'),
        _buildFilterButton('Dessert'),
      ],
    );
  }

  Widget _buildFilterButton(String title) {
    bool isClicked = selectedCategory == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
        widget.onCategorySelected(title); // 🔥 Appelle la fonction pour filtrer
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isClicked ? Color(0xFFFF914C) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFFF914C)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isClicked ? Colors.white : Color(0xFFFF914C),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
