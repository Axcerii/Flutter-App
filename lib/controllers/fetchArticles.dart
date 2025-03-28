import 'package:http/http.dart' as http;
import "package:b3_dev/models/article.dart";
import 'dart:async';
import 'dart:convert';

/* Future<http.Response> fetchArticles() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
} */

Future<List<Article>> fetchArticles() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Article.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load articles');
  }
}

Future<Article> fetchArticleById(int id) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Article.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load articles');
  }
}