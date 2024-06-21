import 'dart:async';
import '../models/item_model.dart';
import '/resources/news_api_provider.dart';
import '/resources/news_db_provider.dart';

// this class is in charge of either gather our data from DB if exists, or send a request to the api to get them
class Repository {
  // NewsApiProvider apiProvider = NewsApiProvider();
  // NewsDbProvider dbProvider = NewsDbProvider();

  List<Source> sources = <Source>[NewsApiProvider(), newsDbProvider];
  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  // Todo - Iterate over sources when dbprovider get fetchTopIds implemented
  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
    // return apiProvider.fetchTopIds();
  }

  Future<ItemModel?> fetchItem(int id) async {
    ItemModel? item;
    Source? source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      if (cache != (source as Cache)) {
        cache.addItem(item!);
      }
    }

    return item;

    //   var item = await dbProvider.fetchItem(id);
    //   if (item != null) {
    //     return item;
    //   }
    //   item = await apiProvider.fetchItem(id);
    //   dbProvider.addItem(item);

    //   return item;
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel?> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
  Future<int> clear();
}
