import 'package:cat_animation/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
// Ticker: Designed to get notified whenever Flutter's engine is about to draw a new frame (refresh rate of our animations = 60 fps)
  late Animation<double> catAnimation;
  // Animation: Records the current value of the property being animated (running, stopped, etc.)
  late AnimationController catController;
  // Controller: Starts, Stops, Restarts the animation during an specified time

  @override
  void initState() {
    super.initState();
    // initState: Assign these values when we first initialized the app

    catController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // this: Refers to our current Ticker

    catAnimation = Tween(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
    // Tween: Describes the range of the animated span
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Cat Animation!'),
      ),
      body: GestureDetector(
        onTap: onTap,
        child: buildAnimation(),
      ),
    );
  }

  // Start/Re-start the animation
  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
      // } else if (catController.status == AnimationStatus.dismissed) {
    } else {
      catController.forward();
    }
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(top: catAnimation.value),
          child: child,
        );
      },
      child: const Cat(),
      // Sometimes we don't want to re-create widgets over and over (creating an expensive widget 60 times/s makes our app heavy), so we define an instance of that widget one time as a child, and then we use it in our AnimatedBuilder
    );
  }
}
