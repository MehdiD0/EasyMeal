import 'package:flutter/material.dart';
import 'dart:math' as Math;

class RatingStars extends StatelessWidget {
  final double rating; 
  final double starSize;
  final double spacing;
  
  RatingStars({
    required this.rating,
    this.starSize = 16.0,
    this.spacing = 4.0, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(5, (index) {
        double fillAmount = (rating - index).clamp(0.0, 1.0);
        return Padding(
          padding: EdgeInsets.only(right: index < 4 ? spacing : 0), 
          child: SizedBox(
            width: starSize,
            height: starSize,
            child: CustomPaint(
              painter: StarPainter(fillAmount),
            ),
          ),
        );
      }),
    );
  }
}

class StarPainter extends CustomPainter {
  final double fillAmount; 
  
  StarPainter(this.fillAmount);

  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..color = Color(0xFF2A2C41)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Paint fillPaint = Paint()
      ..color = Color(0xFFFFF82B)
      ..style = PaintingStyle.fill;

    Path starPath = _createStarPath(size);

    // Draw filled portion
    if (fillAmount > 0) {
      canvas.save();
      canvas.clipRect(Rect.fromLTRB(0, 0, size.width * fillAmount, size.height));
      canvas.drawPath(starPath, fillPaint);
      canvas.restore();
    }

    // Draw star border
    canvas.drawPath(starPath, borderPaint);
  }

  Path _createStarPath(Size size) {
    Path path = Path();
    double halfWidth = size.width / 2;
    double halfHeight = size.height / 2;
    double radius = halfWidth * 0.95; 
    double innerRadius = radius * 0.5;
    
    List<Offset> points = [];
    for (int i = 0; i < 10; i++) {
      double angle = (i * 36 - 90) * (Math.pi / 180); // Correct star alignment
      double r = i.isEven ? radius : innerRadius;
      double x = halfWidth + r * Math.cos(angle);
      double y = halfHeight + r * Math.sin(angle);
      points.add(Offset(x, y));
    }
    path.addPolygon(points, true);
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}