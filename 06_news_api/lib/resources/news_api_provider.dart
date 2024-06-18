import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:news_api/models/item_model.dart';
// for testing we use 'Client' instead of using 'get' directly

const _endpoint = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get(Uri.parse('$_endpoint/topstories.json'));

    final ids = json.decode(response.body);
    return ids.cast<int>();
    // cast: to prevent type error, we tell Dart the type of this list we are returning
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get(Uri.parse('$_endpoint/item/$id.json'));

    final item = json.decode(response.body);
    return ItemModel.fromJson(item);
  }
}
