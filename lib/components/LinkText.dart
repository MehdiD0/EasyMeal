import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const LinkText({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Container(
            height: 2,
            width: 60,
            color: Colors.black,
            margin: EdgeInsets.only(top: 2),
          ),
        ],
      ),
    );
  }
}