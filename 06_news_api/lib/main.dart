import 'package:flutter/material.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_list.dart';
import 'screens/news_detail.dart';
import 'blocs/comments_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      key: UniqueKey(),
      child: StoriesProvider(
        child: const MaterialApp(
          title: 'News',
          onGenerateRoute: routes,
        ),
      ),
    );
  }
}

Route routes(RouteSettings settings) {
  if (settings.name == '/') {
    return MaterialPageRoute(
      builder: (context) {
        final storiesBloc = StoriesProvider.of(context);

        storiesBloc.fetchTopIds();

        return const NewsList();
      },
    );
  } else {
    return MaterialPageRoute(
      builder: (context) {
        final commentsBloc = CommentsProvider.of(context);
        final itemId = int.parse(settings.name!.replaceFirst('/', ''));

        commentsBloc.fetchItemWithComments(itemId);

        return NewsDetail(
          itemId: itemId,
        );
      },
    );
  }
}
