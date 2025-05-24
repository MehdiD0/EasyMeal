import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App",style: TextStyle(
                fontFamily: 'roboto',
                color: Color.fromARGB(255, 255, 128, 0),
              ),),
        backgroundColor: const Color.fromARGB(255, 255, 128, 0),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Application de gestion du menu de la semaine",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Cette application permet aux utilisateurs de gérer leur menu hebdomadaire en ajoutant, modifiant et supprimant des repas."
              " Chaque repas appartient à une catégorie (Entrée, Plat, Dessert) et peut être noté."
              " Les utilisateurs peuvent aussi exporter leur menu sous forme de PDF ou d'image, et utiliser un mode aléatoire pour générer automatiquement des repas.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}