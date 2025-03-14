import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// A utility class to create custom snackbars with dynamic content and styling.
class CustomSnackBar {
  /// Creates a custom Snackbar with an icon and a message.
  ///
  /// [msg] is the message to be displayed.
  /// [alter] determines the icon and color (error or success).
  static SnackBar createSnackbar({required String msg, required bool alter}) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            alter ? Icons.error : Icons.check,
            color: AppTheme.white,
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Text(
              msg,
              style: TextStyle(
                color: AppTheme.white,
                fontSize: 14.sp,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 3,
      width: 90.w,
      padding: const EdgeInsets.all(12),
      duration: const Duration(seconds: 4),
      backgroundColor: AppTheme.secondaryColor,
    );
  }
}
