import 'package:easy_meal/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final Icon? preIcon;
  final IconButton? sufIcon;
  final TextEditingController controller;
  final bool isObscure;
  final String? Function(String?)? validator;

  const PrimaryTextField({
    super.key,
    required this.hintText,
    required this.preIcon,
    required this.controller,
    required this.isObscure,
    required this.validator,
    this.sufIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76.w,
      child: TextFormField(
        controller: controller,
        obscureText: isObscure,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 190, 181, 181),
            fontSize: 18.sp,
          ),
          enabledBorder: AppTheme.textFieldEnableBorder,
          focusedBorder: AppTheme.textFieldFocusedBorder,
          filled: true,
          fillColor: AppTheme.fillColor,
          prefixIcon:
              preIcon,
          prefixIconColor: AppTheme.iconColor, 
          suffixIcon:
              sufIcon,
          suffixIconColor: AppTheme.iconColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 3.w,
          ),
        ),
      ),
    );
  }
}
