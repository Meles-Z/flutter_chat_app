import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screen/dashboard_screen.dart';

class LoginController {
  static Future<void> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const DashboardScreen();
      }), (route) {
        return false;
      });
    } catch (e) {
      SnackBar mesageSnackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(mesageSnackBar);
      print(e);
    }
  }
}
