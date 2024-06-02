import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // all the names before ':' which start with lower case letters are 'named parameters' passed to their parent classes, and after ':' we have names/classes which begin with an upper-case letter.
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          'Lets\'s see some images',
        )),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
