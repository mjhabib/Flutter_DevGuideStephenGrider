import 'package:flutter/material.dart';
import '/blocs/bloc.dart';

// Apply BLoC to our project using "Scoped Instances" method (might be better for large apps)
class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({super.key, required super.child});

  @override
  bool updateShouldNotify(oldWidget) => true;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }
}
