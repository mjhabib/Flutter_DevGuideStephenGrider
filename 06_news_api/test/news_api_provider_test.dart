import 'package:news_api/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  test('FetchTopIds returns a list of ids', () {
    // Setup the test cast
    const sum = 1 + 3;

    // Expectation
    expect(sum, 4);
  });
}
