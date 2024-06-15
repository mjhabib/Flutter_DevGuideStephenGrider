import 'package:cat_animation/widgets/cat.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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

  late Animation<double> boxAnimation;
  late AnimationController boxController;

  @override
  void initState() {
    super.initState();
    // initState: Assign these values when we first initialized the app

    catController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // this: Refers to our current Ticker

    catAnimation = Tween(begin: -35.0, end: -80.0)
        .animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
    // Tween: Describes the range of the animated span

    boxController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    boxAnimation = Tween(begin: pi / 10, end: 0.15)
        .animate(CurvedAnimation(parent: boxController, curve: Curves.linear));

    boxController.forward();

    boxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });
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
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                buildCatAnimation(),
                buildBox(),
                buildLeftFlap(),
                buildRightFlap(),
              ],
            ),
          )),
    );
  }

  // Start/Re-start the animation
  onTap() {
    if (catController.status == AnimationStatus.completed) {
      boxController.forward();
      catController.reverse();
      // } else if (catController.status == AnimationStatus.dismissed) {
    } else {
      boxController.stop();
      catController.forward();
    }
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        // Workaround type error
        final ch = child ??
            Container(
              child: child,
            );
        // return Container(
        // margin: EdgeInsets.only(top: catAnimation.value),
        return Positioned(
            top: catAnimation.value, right: 0.0, left: 0.0, child: ch);
      },
      child: const Cat(),
      // Sometimes we don't want to re-create widgets over and over (creating an expensive widget 60 times/s makes our app heavy), so we define an instance of that widget one time as a child, and then we use it in our AnimatedBuilder
    );
  }

  Widget buildBox() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap() {
    return AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          width: 10,
          height: 125,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topLeft, // define the center point of rotation
            angle: boxAnimation.value,
            child: child, // math.pi = rotate by radians
          );
        });
  }

  Widget buildRightFlap() {
    return Positioned(
      right: 0.0,
      top: 3,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          width: 10,
          height: 125,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: -boxAnimation.value,
            alignment: Alignment.topLeft,
            child: child,
          );
        },
      ),
    );
  }
}
