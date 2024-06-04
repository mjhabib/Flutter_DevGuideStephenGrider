import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            emailField(),
            passField(),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
            ),
            submitButton()
          ],
        )));
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: 'Email: ', hintText: 'mail@test.com'),
    );
  }

  Widget passField() {
    return TextFormField(
      obscureText: true,
      decoration:
          const InputDecoration(labelText: 'Password: ', hintText: '******'),
    );
  }

  Widget submitButton() {
    return ElevatedButton(onPressed: () {}, child: const Text('Submit'));
  }
}
