import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screen/profile_screen.dart';
import 'package:flutter_chat_app/screen/splash_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Global Chat')),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              ListTile(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ProfileScreen();
                    }),
                  );
                },
                title: Text('Profile'),
                leading: Icon(Icons.people),
              ),
              ListTile(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const SplashScreen();
                  }), (route) {
                    return false;
                  });
                },
                title: Text('Logout'),
                leading: Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const Text("Welcome"),
          Text((user?.email ?? "").toString()),
        ],
      ),
    );
  }
}
