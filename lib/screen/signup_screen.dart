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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup page'),
      ),
      body: Form(
        key: useForm,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
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
              ElevatedButton(
                  onPressed: () {
                    if (useForm.currentState!.validate()) {
                      SignupController.createAccount(
                          context: context,
                          email: email.text,
                          password: password.text);
                    }
                  },
                  child: const Text('Create Account'))
            ],
          ),
        ),
      ),
    );
  }
}
