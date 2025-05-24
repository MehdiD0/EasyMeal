// import 'package:flutter/material.dart';
// import 'package:easy_meal/components/RatingStars.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class RatingCard extends StatelessWidget {
//   final Image imageUrl;
//   final String title;
//   final double rating;

//   RatingCard({
//     required this.imageUrl,
//     required this.title,
//     required this.rating,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double cardWidth = screenWidth * 0.4;
//     double cardHeight = cardWidth * 1.4;

//     return Container(
//       width: cardWidth,
//       height: cardHeight,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: SizedBox(
//               width: cardWidth,
//               height: cardHeight,
//               child: FittedBox(
//                 fit: BoxFit.cover,
//                 child: imageUrl,
//               ),
//             ),
//           ),

//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(221, 0, 0, 0).withOpacity(0.2),
//                 borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     title,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.04,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   RatingStars(rating: rating),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:easy_meal/components/RatingStars.dart';
import 'package:easy_meal/models/meal_model.dart'; // Adjust path as needed
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:typed_data';

class RatingCard extends StatelessWidget {
  final MealModel meal;

  RatingCard({required this.meal});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.4;
    double cardHeight = cardWidth * 1.4;

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: cardWidth,
              height: cardHeight,
              child:
                  meal.image != null && meal.image!.isNotEmpty
                      ? Image.memory(meal.image!, fit: BoxFit.cover)
                      : Container(color: Colors.grey),
              // Placeholder
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: const Color.fromARGB(221, 0, 0, 0).withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    meal.getName(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  RatingStars(rating: meal.getRating().toDouble()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
