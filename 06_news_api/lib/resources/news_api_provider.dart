import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:news_api/models/item_model.dart';
// for testing we use 'Client' instead of using 'get' directly

const _endpoint = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final response = await client.get(Uri.parse('$_endpoint/topstories.json'));

    final ids = json.decode(response.body);
    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get(Uri.parse('$_endpoint/item/$id.json'));

    final item = json.decode(response.body);
    return ItemModel.fromJson(item);
  }
}
