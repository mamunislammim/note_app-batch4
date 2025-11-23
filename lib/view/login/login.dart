import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/database/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottom/bottom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),

              TextField(
                controller: passController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),

              InkWell(
                onTap: () async {
                  if (emailController.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Email")));
                  } else if (emailController.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Password")));
                  }

                  var a = UserData.user.where((v) => v['email'] == emailController.text && v['password'] == passController.text);
                  if (a.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));
                    final SharedPreferences p = await SharedPreferences.getInstance();
                    await p.setBool('isLogin', true);
                    // await p.getBool("isLogin");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomBar()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong User or Password.")));
                  }
                },
                child: Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () async {
              //     final SharedPreferences p = await SharedPreferences.getInstance();
              //     log("====SET=======");
              //   },
              //   child: Text("Set Data"),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     final SharedPreferences p = await SharedPreferences.getInstance();
              //    var d =  p.getBool("isLogin");
              //     log("=====GET==$d====");
              //   },
              //   child: Text("Get Data"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
