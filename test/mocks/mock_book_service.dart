import 'package:hp_api_fetch/data/service/book_service.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

// Generate mocks with: flutter pub run build_runner build
@GenerateMocks([BookService, http.Client])
import 'mock_book_service.dart';
