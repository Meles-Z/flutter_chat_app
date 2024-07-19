import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screen/dashboard_screen.dart';
import 'package:flutter_chat_app/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (user == null) {
        openLogin();
      } else {
        openDashboard();
      }
      openLogin();
    });
    super.initState();
  }

  void openDashboard() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const DashboardScreen();
    }));
  }

  void openLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
