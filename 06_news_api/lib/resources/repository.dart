import 'dart:async';
import '../models/item_model.dart';
import '/resources/news_api_provider.dart';
import '/resources/news_db_provider.dart';

// this class is in charge of either gather our data from DB if exists, or send a request to the api to get them
class Repository {
  NewsApiProvider apiProvider = NewsApiProvider();
  NewsDbProvider dbProvider = NewsDbProvider();

  Future<List<int>> fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItems(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null) {
      return item;
    }
    item = await apiProvider.fetchItem(id);
    dbProvider.addItem(item);

    return item;
  }
}
