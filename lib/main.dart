import 'package:easy_meal/local_storage_management/hive_services.dart';
import 'package:easy_meal/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await HiveServices.initHive();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (buildContext, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: 
          //MealPage(),
          SignInPage(),
        );
      },
    );
  }
}
