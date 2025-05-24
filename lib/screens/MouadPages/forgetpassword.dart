import 'package:easy_meal/components/snackbar.dart';
import 'package:easy_meal/firbase_authentication/auth_services.dart';
import 'package:flutter/material.dart';

void showForgotPasswordBottomSheet(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  final authService = AuthService();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFFF914C),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logowhite.png', height: 220),
              SizedBox(height: 10),
              Text(
                "Enter your email address to receive a password reset link. A validation email will be sent to help you securely reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Jua',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mail :",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () async {
                  String email = emailController.text.trim();
                  bool success = await authService.resetPassword(email);
                  Navigator.of(context).pop(); // Close bottom sheet

                  ScaffoldMessenger.of(context).showSnackBar(
                    CustomSnackBar.createSnackbar(
                      msg:
                          success
                              ? "Email sent successfully! Please check your inbox"
                              : "Failed to send email. Please try again",
                      alter: !success,
                    ),
                  );
                },
                child: Text(
                  "SEND",
                  style: TextStyle(fontSize: 16, color: Color(0xFFFF914C)),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
