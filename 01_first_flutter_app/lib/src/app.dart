import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http
    show get; // I only care about the 'get' class
import '/src/models/image_model.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  void fetchImage() async {
    counter++;
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    var imgageModel = ImageModel.fromJson(json.decode(response.body));
  }

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
          onPressed: fetchImage,
          // short for code below
          // onPressed: () {
          //   fetchImage();
          // },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
