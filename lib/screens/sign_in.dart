// ignore: file_names
import 'package:easy_meal/components/buttons.dart';
import 'package:easy_meal/components/snackbar.dart';
import 'package:easy_meal/components/text_field.dart';
import 'package:easy_meal/components/wavy_header.dart';
import 'package:easy_meal/firbase_authentication/auth_services.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/helpers/validators.dart';
import 'package:easy_meal/screens/MouadPages/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  bool isCheked = false;
  bool isVisible = true;
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  WavyHeader(),
                  Transform.translate(
                    offset: Offset(0, 37.sp),
                    child: Image.asset('assets/icon.png', height: 50.sp),
                  ),
                ],
              ),
              //SizedBox(height: 5.h),
              // SizedBox(
              //   height: 19.h,
              //   child: WavyHeader(),
              // ),
              // //SizedBox(height: 1.h),
              // Image.asset('assets/icon.png', height: 50.sp),
              SizedBox(height: 6.h),
              Text("Welcome back !", style: AppTheme.titleStyle),
              SizedBox(height: 1.h),
              Text(
                "To join us you should login first",
                style: AppTheme.paragraphStyle,
              ),
              SizedBox(height: 6.h),
              PrimaryTextField(
                hintText: "Enter email address",
                preIcon: const Icon(Icons.email),
                isObscure: false,
                validator: FormValidators.validateEmailFct,
                controller: emailController,
              ),
              SizedBox(height: 4.h),
              PrimaryTextField(
                hintText: "Password",
                preIcon: const Icon(Icons.lock),
                sufIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                isObscure: isVisible,
                validator: FormValidators.validatePassFct,
                controller: passwController,
              ),
              SizedBox(height: 3.h),
              PrimaryTextButton(label: "Forgot Password?", onPressed: () {
                showForgotPasswordBottomSheet(context);
                  
              }),
              PrimaryButton(
                label: isLoading ? "" : "Login",
                onPressed:
                    isLoading
                        ? null
                        : () async {
                          if (formState.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            String email = emailController.text.trim();
                            String password = passwController.text.trim();

                            var sucess = await AuthService().signIn(
                              email,
                              password,
                            );
                            if (sucess != null) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                CustomSnackBar.createSnackbar(
                                  msg: "User Login Succefully",
                                  alter: false,
                                ),
                              );
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                CustomSnackBar.createSnackbar(
                                  msg: "Error when Login",
                                  alter: true,
                                ),
                              );
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                isLoading: isLoading,
              ),
              SizedBox(height: 2.h),
              Center(
                child: Row(
                  children: [
                    SizedBox(width: 25.w),
                    Text(
                      "Don't have an account?",
                      style: AppTheme.paragraphStyle,
                    ),
                    PrimaryTextButton(
                      label: "Sign Up",
                      onPressed: () {
                        //   Navigator.pushReplacementNamed(
                        //     context,
                        //     //AppRouter.routeLogin,
                        //   );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwController.dispose();
    super.dispose();
  }
}
