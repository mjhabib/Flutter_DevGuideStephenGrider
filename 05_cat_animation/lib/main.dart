// import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  // Show layout lines for debugging
  // debugPaintSizeEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'Animation',
      home: const Home(),
    );
  }
}
