import 'package:flutter/material.dart';
import 'package:note_app/view/login/login.dart';
import 'package:note_app/view/splash/splash.dart';

void main(){
  runApp(
    MyApp()
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
