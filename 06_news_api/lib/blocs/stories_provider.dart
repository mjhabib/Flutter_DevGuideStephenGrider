import 'package:flutter/material.dart';
import '/blocs/stories_bloc.dart';

class StoriesProvider extends InheritedWidget {
  late final StoriesBloc bloc;

  StoriesProvider({super.key, required super.child}) : bloc = StoriesBloc();

  @override
  bool updateShouldNotify(_) => true;
  static StoriesBloc of(BuildContext context) {
    return (context.getInheritedWidgetOfExactType() as StoriesProvider).bloc;
  }
}
