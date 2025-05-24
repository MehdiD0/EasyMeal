import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDialog {
  static AlertDialog createDialog({
    required BuildContext context,
    required String title,
    required String content,
    Function()? onConfirm,
    Function()? onCancel,
  }) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTheme.labelStyle.copyWith(fontSize: 18.sp),
      ),
      content: Text(
        content,
        style: AppTheme.paragraphStyle,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, false);
              if (onCancel != null) onCancel();
            },
            child: Text(
              "Cancel",
              style: AppTheme.button_text.copyWith(color: AppTheme.black),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context, true);
              if (onConfirm != null) onConfirm();
            },
            child: Text(
              "Yes",
              style: AppTheme.button_text.copyWith(color: AppTheme.black),
            )),
      ],
    );
  }
}
