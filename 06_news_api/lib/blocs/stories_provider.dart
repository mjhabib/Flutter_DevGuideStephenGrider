import 'package:flutter/material.dart';
import 'stories_bloc.dart';
export 'stories_bloc.dart';
// this export helps us to have access to the type StoriesBloc, when we import StoriesProvider but we don't wanna import StoriesBloc!

class StoriesProvider extends InheritedWidget {
  late final StoriesBloc bloc;

  StoriesProvider({super.key, required super.child}) : bloc = StoriesBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static StoriesBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<StoriesProvider>())!
        .bloc;
  }
}
