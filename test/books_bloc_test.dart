import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api_fetch/commons/blocs/books/books_bloc.dart';
import 'package:hp_api_fetch/data/models/book.dart';
import 'package:hp_api_fetch/utils/constants.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'mocks/mock_book_service.mocks.dart';

void main() {
  late BooksBloc booksBloc;
  late MockBookService mockBookService;

  setUp(() {
    mockBookService = MockBookService();
    booksBloc = BooksBloc(bookService: mockBookService, books: []);
  });

  tearDown(() {
    booksBloc.close();
  });

  final mockBooks = [
    Book(
      number: 1,
      title: 'Harry Potter and the Philosopher\'s Stone',
      originalTitle: 'Harry Potter and the Philosopher\'s Stone',
      pages: 344,
      releaseDate: '1997-06-26',
      description: "dfkslfkjsaflkasjs",
      cover: "httpsewfjkwjfw",
      index: 1,
    ),
    Book(
      number: 2,
      title: 'Harry Potter and the Chamber of Secrets',
      originalTitle: 'Harry Potter and the Chamber of Secrets',
      pages: 444,
      releaseDate: '1998-07-02',
      description: "dfkslfkjsaflkasjs",
      cover: "httpsewfjkwjfw",
      index: 2,
    ),
  ];

  group('BooksBloc', () {
    blocTest<BooksBloc, BooksState>(
      'emits [BooksLoadInProgress, BooksLoadSuccess] when BooksFetchEvent succeeds',
      build: () {
        when(mockBookService.getAllBooks()).thenAnswer((_) async => mockBooks);
        return booksBloc;
      },
      act: (bloc) => bloc.add(BooksFetchEvent()),
      expect: () => [
        const BooksLoadInProgress(),
        BooksLoadSuccess(mockBooks),
      ],
      verify: (bloc) {
        print('Actual states: ${bloc.stream.toList()}');
      },
    );

    blocTest<BooksBloc, BooksState>(
      'emits [BooksLoadInProgress, BooksLoadFailure] when BooksFetchEvent fails',
      build: () {
        when(mockBookService.getAllBooks()).thenThrow(Exception('Network error'));
        return booksBloc;
      },
      act: (bloc) => bloc.add(BooksFetchEvent()),
      expect: () => [
        const BooksLoadInProgress(),
        BooksLoadFailure(exception: Exception('${Constants.failedLoading}' 'Network error')),
      ],
    );

    blocTest<BooksBloc, BooksState>(
      'filters books by title for SearchBooksEvent',
      build: () {
        when(mockBookService.getAllBooks()).thenAnswer((_) async => mockBooks);
        // Manually set _allBooks to avoid emitting states during seed
        booksBloc.books = mockBooks;
        return booksBloc;
      },
      seed: () => BooksLoadSuccess(mockBooks),
      act: (bloc) => bloc.add(BooksSearchEvent(query: 'Philos')),
      expect: () => [
        const BooksLoadInProgress(),
        BooksLoadSuccess([
          mockBooks[0], // Only 'Philosopher's Stone' matches
        ]),
      ],
    );

    blocTest<BooksBloc, BooksState>(
      'returns all books for empty SearchBooksEvent query',
      build: () {
        when(mockBookService.getAllBooks()).thenAnswer((_) async => mockBooks);
        // Manually set _allBooks to avoid emitting states during seed
        booksBloc.books = mockBooks;
        return booksBloc;
      },
      seed: () => BooksLoadSuccess(mockBooks),
      act: (bloc) => bloc.add(BooksSearchEvent(query: '')),
      expect: () => [
        const BooksLoadInProgress(),
        BooksLoadSuccess(mockBooks),
      ],
    );
  });
}
