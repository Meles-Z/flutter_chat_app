import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controllers/login_controller.dart';
import 'package:flutter_chat_app/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginScreen> {
  var useForm = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      //   centerTitle: true,
      // ),
      body: Form(
        key: useForm,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/logo.png")),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: email,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                },
                decoration: const InputDecoration(label: Text("Email")),
              ),
              const SizedBox(
                height: 23,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                },
                decoration: const InputDecoration(label: Text("Password")),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 50),
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (useForm.currentState!.validate()) {
                            LoginController.login(
                                context: context,
                                email: email.text,
                                password: password.text);
                          }
                        },
                        child: const Text('Login')),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("Have you account yet?"),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignupScreen();
                      }));
                    },
                    child: const Text(
                      "Signup Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
