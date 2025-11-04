import 'dart:convert';

import 'package:hp_api_fetch/data/models/book.dart';
import 'package:http/http.dart' as http;

class HPApi {
  Future<List<Book>?> getAllBooks() async {
    var client = http.Client();
    var uri = Uri.parse('https://potterapi-fedeperin.vercel.app/en/books');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      // Parse the JSON response as a list
      List<dynamic> jsonList = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
      // Map the JSON list to a List<Book>
      return jsonList.map((json) => Book.fromJson(json)).toList();
    }
    return null;
  }
}
