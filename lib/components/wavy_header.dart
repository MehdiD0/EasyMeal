import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';

class WavyHeaderPainter extends CustomPainter {
  final Color startColor;
  final Color endColor;

  WavyHeaderPainter({required this.startColor, required this.endColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..shader = LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          ..style = PaintingStyle.fill;

    final Path path = Path();
    path.lineTo(0, size.height * 0.75);

    // Première courbe
    final firstControlPoint = Offset(size.width * 0.20, size.height * 0.67);
    final firstEndPoint = Offset(size.width * 0.34, size.height * 0.85);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    // Deuxième courbe
    final secondControlPoint = Offset(size.width * 0.75, size.height * 0.40);
    final secondEndPoint = Offset(size.width, size.height * 0.70);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class WavyHeader extends StatelessWidget {
  final double height;
  final Color startColor;
  final Color endColor;

  const WavyHeader({
    super.key,
    this.height = 180.0,
    this.startColor = AppTheme.primaryColor,
    this.endColor = AppTheme.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavyHeaderPainter(startColor: startColor, endColor: endColor),
      size: Size(double.infinity, height),
    );
  }
}
