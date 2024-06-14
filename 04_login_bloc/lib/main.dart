import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import '/blocs/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // The Provider doesn't need to be this high in our app hierarchy, but for the purpose of this tutorial, we're gonna use it here as an example
    return Provider(
      child: const MaterialApp(
        title: 'Log me in!',
        home: Scaffold(
          body: Center(
            child: LoginScreen(),
          ),
        ),
      ),
    );
  }
}
