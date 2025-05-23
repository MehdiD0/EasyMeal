import 'dart:typed_data';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/helpers/comments_management.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommentItem extends StatelessWidget {
  final String ?content;
  final String ?description;
  final String ?time;
  final Uint8List ?imageBytes;

  const CommentItem({
    super.key,
    required this.time,
    required this.description,
    required this.content,
    required this.imageBytes,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double imageSize =
        isLandscape ? 80 : 50;  //LandScappe veut dire mode payssage

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppTheme.bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: CommentsManagement.getImageProvider(imageBytes!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 5),
                Text(content??''),
              ],
            ),
          ),
          Text(time??'default time'),
        ],
      ),
    );
  }
}
