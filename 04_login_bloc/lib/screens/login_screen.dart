import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(bloc),
          passField(bloc),
          Container(margin: const EdgeInsets.only(bottom: 20)),
          submitButton()
        ],
      ),
    );
  }
}

Widget emailField(Bloc bloc) {
  return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          // onChanged: bloc.changeMail,  // Short version of the code below
          onChanged: (value) {
            bloc.changeMail(value);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'mail@you.com',
              labelText: 'Email Address:',
              errorText: snapshot.error?.toString()),
        );
      });
}

Widget passField(Bloc bloc) {
  return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePass,
          obscureText: true,
          decoration: InputDecoration(
              hintText: '******',
              labelText: 'Password:',
              errorText: snapshot.error?.toString()),
        );
      });
}

Widget submitButton() {
  return ElevatedButton(onPressed: () {}, child: const Text('Submit'));
}
