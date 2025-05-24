import 'package:easy_meal/helpers/app_theme.dart';

import '../../Components/MouadComponents/cards.dart';
import '../../Components/MouadComponents/line.dart';
import 'package:flutter/material.dart';

class TypeRepasPage extends StatelessWidget {
  const TypeRepasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back, color: Colors.black),
        //     onPressed: () => Navigator.pop(context),
        //   ),
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        backgroundColor: AppTheme.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30,
                    ), // Or your preferred color
                    onPressed: () {
                      Navigator.pop(context); // This pops the current page
                    },
                  ),
                  SizedBox(width: 70),
                  Text(
                    "Repas",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jua',
                      color: Color(0xFFFF914C),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              Line1(),
              SizedBox(height: 120),
              RepasCard(
                title: "Dejeuner",
                imageUrl: "assets/dejeuner.png",
                onTap: () {
                  print("Dejeuner sélectionné");
                },
              ),
              SizedBox(height: 70),
              RepasCard(
                title: "Diner",
                imageUrl: "assets/diner.jpg",
                onTap: () {
                  print("Diner sélectionné");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
