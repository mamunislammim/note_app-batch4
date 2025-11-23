import 'package:flutter/material.dart';
import 'package:note_app/view/bottom/bottom.dart';
import 'package:note_app/view/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  timerFunCall() async {
    await Future.delayed(Duration(seconds: 2));
    final SharedPreferences v = await SharedPreferences.getInstance();
    var a = v.getBool("isLogin");
    if (a == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomBar()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  void initState() {
    timerFunCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset("assets/img.png")));
  }
}
