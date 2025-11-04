import 'package:hp_api_fetch/data/models/book.dart';
import 'package:hp_api_fetch/data/provider/hp_api.dart';

class BookService {
  final _api = HPApi();
  Future<List<Book>?> getAllBooks() async {
    return _api.getAllBooks();
  }
}
