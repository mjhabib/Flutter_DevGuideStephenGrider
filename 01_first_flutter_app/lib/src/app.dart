import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // all the names before ':' which start with lower case letters are 'named parameters' passed to their parent classes, and after ':' we have names/classes which begin with an upper-case letter.
      home: Scaffold(
        body: Text('$counter'),
        appBar: AppBar(
            title: const Text(
          'Lets\'s see some images',
        )),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
        ),
      ),
    );
  }
}
