import 'package:flutter/material.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: const MaterialApp(
        title: 'News',
        home: NewsList(),
      ),
    );
  }
}
