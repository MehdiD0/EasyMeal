import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';

class MealFilterButtons extends StatefulWidget {
  const MealFilterButtons({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MealFilterButtonsState createState() => _MealFilterButtonsState();
}

class _MealFilterButtonsState extends State<MealFilterButtons> {
  String _selectedCategory = 'Desset';

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  Widget _buildCategoryButton(String text, bool isSelected) {
    return Transform.rotate(
      angle: 0.7854, // 45 degrés en radians (π/4)
      child: GestureDetector(
        onTap: () => _onCategorySelected(text),
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : LinearGradient(
                    colors: [AppTheme.secondaryColor, AppTheme.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Transform.rotate(//si en le fait pas , le text doit rotat comme rectagle
            angle: -0.7854, // Rotation inverse pour le texte
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : AppTheme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCategoryButton("Desset", _selectedCategory == "Desset"),
        SizedBox(width: 20),
        _buildCategoryButton("Dinner", _selectedCategory == "Dinner"),
      ],
    );
  }
}
