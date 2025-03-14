import 'package:easy_meal/components/buttons.dart';
import 'package:easy_meal/components/text_field.dart';
import 'package:easy_meal/components/wavy_header.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children:[
          WavyHeader(),
          PrimaryTextField(hintText: "Hakim", controller: TextEditingController(), isObscure: false, validator: (dta){return "s";}, preIcon: null,),
          PrimaryButton(label: "Hakim",)
        ] 
      ),
    );
  }
}