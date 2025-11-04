import 'dart:convert';

import 'package:hp_api_fetch/data/models/book.dart';
import 'package:hp_api_fetch/utils/constants.dart';
import 'package:http/http.dart' as http;

class HPApi {
  Future<List<Book>?> getAllBooks() async {
    var client = http.Client();
    var uri = Uri.parse(Constants.apiUrl);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));

      return jsonList.map((json) => Book.fromJson(json)).toList();
    }
    return null;
  }
}
