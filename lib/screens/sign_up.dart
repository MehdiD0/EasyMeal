// ignore: file_names
import 'package:easy_meal/components/buttons.dart';
import 'package:easy_meal/components/snackbar.dart';
import 'package:easy_meal/components/text_field.dart';
import 'package:easy_meal/components/wavy_header.dart';
import 'package:easy_meal/firbase_authentication/auth_services.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  bool isCheked = false;
  bool isVisible = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
              Text("Create New Account !", style: AppTheme.titleStyle),
              SizedBox(height: 1.h),
              Text(
                "Please fill in the forms to continue",
                style: AppTheme.paragraphStyle,
              ),
              SizedBox(height: 3.h),
              PrimaryTextField(
                hintText: "Full name",
                preIcon: const Icon(Icons.account_circle_rounded),
                isObscure: false,
                validator: FormValidators.validateFullName,
                controller: nameController,
              ),
              SizedBox(height: 3.h),
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
              Row(
                children: [
                  SizedBox(width: 8.5.w),
                  Checkbox(
                    checkColor: AppTheme.white,
                    fillColor: WidgetStateProperty.resolveWith((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.selected)) {
                        return AppTheme
                            .primaryColor; // Couleur quand la case est cochée
                      }
                      return AppTheme
                          .white; // Couleur quand la case n'est pas cochée
                    }),
                    value: isCheked,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheked = value ?? false;
                      });
                    },
                    activeColor: AppTheme.black,
                  ),
                  SizedBox(width: 0.25.w),
                  Text(
                    "I agree with Terms & Conditions",
                    style: AppTheme.paragraphStyle,
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              PrimaryButton(
                label: 'Sign Up',
                onPressed: () async {
                  if (formState.currentState!.validate()) {
                    String email = emailController.text.trim();
                    String password = passwController.text.trim();
                    String name = nameController.text.trim();

                    if (isCheked) {
                      AuthService authService = AuthService();
                      var user = authService.signUp(email, password, name);
                      ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar.createSnackbar(
                        msg: "You Welcome",
                        alter: false,
                      ),
                    );
                    print("Utilisateur créé avec succès");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackBar.createSnackbar(
                          msg: "Error When Sign UP",
                          alter: false,
                        ),
                      );
                      print("Error When Sign UP");
                    }
                  }
                },
              ),
              SizedBox(height: 2.h),
              Center(
                child: Row(
                  children: [
                    SizedBox(width: 25.w),
                    Text(
                      "Already have an account?",
                      style: AppTheme.paragraphStyle,
                    ),
                    PrimaryTextButton(
                      label: "Login",
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
    nameController.dispose();
    super.dispose();
  }
}
