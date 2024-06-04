import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  // this GlobalKey allow us to reference any methods/properties associated with it, like form validation
  String? mail;
  String? pass;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Form(
            key: formKey,
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
      validator: (value) {
        if (value != null) {
          if (!value.contains('@')) {
            return 'Please enter a valid email';
          }
        }
        return null;
      },
      onSaved: (newMail) {
        mail = newMail;
      },
    );
  }

  Widget passField() {
    return TextFormField(
      obscureText: true,
      decoration:
          const InputDecoration(labelText: 'Password: ', hintText: '******'),
      validator: (value) {
        if (value != null) {
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
        }
        return null;
      },
      onSaved: (newPass) {
        pass = newPass;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print('Saved $mail and $pass.');
          }
        },
        child: const Text('Submit'));
  }
}
