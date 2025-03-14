import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Function()? onPressed;
  final bool isLoading;
  final dynamic color;
  

  const PrimaryButton({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.color = AppTheme.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.w),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppTheme.primaryColor,
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox(
                height: 3.h,
                width: 3.h,
                child: const CircularProgressIndicator(
                  color: AppTheme.white,
                  strokeWidth: 1,
                ),
              )
            else
              Text(
                label ?? "",
                style: AppTheme.button_text,
                textAlign: TextAlign.center,
              ),
            if (!isLoading && icon != null) ...[
              SizedBox(width: 3.w),
              Icon(
                icon,
                size: 3.h,
                color: AppTheme.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A simple reusable text button widget.
class PrimaryTextButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const PrimaryTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: AppTheme.secondaryColor,
        ),
      ),
    );
  }
}
