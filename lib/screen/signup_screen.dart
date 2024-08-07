import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controllers/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var useForm = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: useForm,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
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
                        decoration:
                            const InputDecoration(label: Text("Password")),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: name,
                        autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is required";
                          }
                        },
                        decoration: const InputDecoration(label: Text("Name")),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: country,
                        autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Country is required";
                          }
                        },
                        decoration:
                            const InputDecoration(label: Text("Country")),
                      ),
                      const SizedBox(
                        height: 23,
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
                                    SignupController.createAccount(
                                        context: context,
                                        email: email.text,
                                        password: password.text,
                                        name: name.text,
                                        country: country.text);
                                  }
                                },
                                child: const Text('Create Account')),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
