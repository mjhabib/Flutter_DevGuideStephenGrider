import 'package:cat_animation/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Cat Animation!'),
      ),
      body: Center(
        child: buildAnimation(),
      ),
    );
  }

  Widget buildAnimation() {
    return const Cat();
  }
}
