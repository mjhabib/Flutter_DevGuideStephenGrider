import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(),
          passField(),
          Container(margin: const EdgeInsets.only(bottom: 20)),
          submitButton()
        ],
      ),
    );
  }
}

Widget emailField() {
  return const TextField(
    keyboardType: TextInputType.emailAddress,
    decoration:
        InputDecoration(hintText: 'mail@you.com', labelText: 'Email Address:'),
  );
}

Widget passField() {
  return const TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: '******', labelText: 'Password:'),
  );
}

Widget submitButton() {
  return ElevatedButton(onPressed: () {}, child: const Text('Submit'));
}
