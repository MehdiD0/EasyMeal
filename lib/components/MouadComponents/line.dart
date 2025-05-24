import 'package:flutter/material.dart';

class Line1 extends StatelessWidget {
  const Line1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2), // Espacement sur les côtés
      height: 5, // Épaisseur du trait
      width: double.infinity, // Prend toute la largeur disponible
      decoration: BoxDecoration(
        color: Color(0xFFFF914C), // Couleur orange
        borderRadius: BorderRadius.circular(10), // Bords arrondis
      ),
    );
  }
}
