import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import 'loading_container.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  const NewsListTile({super.key, required this.itemId});

  @override
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return const LoadingContainer();
        }

        return FutureBuilder(
          future: snapshot.data?[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return const LoadingContainer();
            }

            return buildTile(context, itemSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildTile(BuildContext context, ItemModel? item) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/${item.id}');
          },
          title: Text(item!.title),
          subtitle: Text('${item.score} points'),
          trailing: Column(
            children: [
              const Icon(Icons.comment),
              Text('${item.descendants}'),
            ],
          ),
        ),
        const Divider(
          height: 8.0,
        ),
      ],
    );
  }
}
