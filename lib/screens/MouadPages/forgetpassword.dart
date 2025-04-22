import 'package:flutter/material.dart';

void showForgotPasswordBottomSheet(BuildContext context) {
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
            color: Color(0xFFFF914C), // Couleur d'arrière-plan orange
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo
              Image.asset('assets/MouadPart/logowhite.png', height: 220),
              SizedBox(height: 10),

              // Texte d'instructions
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

              //  Email
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

              // Bouton d'envoi
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  // Action pour envoyer l'email
                },
                child: Text(
                  "SEND",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFF914C), // Texte orange
                  ),
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
