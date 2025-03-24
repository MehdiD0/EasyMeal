import 'dart:io';

import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/helpers/comments_management.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommentItem extends StatelessWidget {
  final String content;
  final String description;
  final String time;
  final String imagePath;
  const CommentItem({
    super.key,
    required this.time,
    required this.description,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 19),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppTheme.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 9.w,
            height: 4.9.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: CommentsManagement.getImageProvider(imagePath),
                //fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(description),
                SizedBox(width: 27.h),
              ],
            ),
          ),
          Text(time),
        ],
      ),
    );
  }
}
