import 'package:news_api/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    // Setup the test cast
    // const sum = 1 + 3;
    // Expectation
    // expect(sum, 4);

    final newsApi = NewsApiProvider();
    // Instead of sending a real request to the server, we send a mock request to see how our app behaves. In that case we get an instance response because we don't have to wait for an outside server, and also we have the ability to control the data.
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test('FetchItem returns an item', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode({'id': 123}), 200);
    });

    final item = await newsApi.fetchItem(999);
    expect(item.id, 123);
  });
}
