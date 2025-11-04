import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hp_api_fetch/data/models/book.dart';
import 'package:hp_api_fetch/data/service/book_service.dart';
import 'package:hp_api_fetch/utils/constants.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BookService bookService;
  List<Book> books;

  BooksBloc({required this.bookService, required this.books}) : super(const BooksInitial()) {
    on<BooksFetchEvent>(_onFetchBooks);
    on<BooksSearchEvent>(_onSearchBooks);
  }

  Future<void> _onFetchBooks(BooksFetchEvent event, Emitter<BooksState> emit) async {
    emit(const BooksLoadInProgress());
    try {
      final fetchedBooks = await bookService.getAllBooks();
      if (fetchedBooks != null) {
        emit(BooksLoadSuccess(fetchedBooks));
        books = fetchedBooks;
      } else {
        emit(BooksLoadFailure(exception: Exception(Constants.noBooks)));
      }
    } catch (e) {
      emit(BooksLoadFailure(exception: Exception('${Constants.failedLoading}' '$e')));
    }
  }

  Future<void> _onSearchBooks(BooksSearchEvent event, Emitter<BooksState> emit) async {
    emit(const BooksLoadInProgress());
    try {
      // Filter books by title
      final filteredBooks = books.where((book) {
        return book.title.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      if (filteredBooks.isNotEmpty) {
        emit(BooksLoadSuccess(filteredBooks));
      } else {
        emit(BooksLoadFailure(exception: Exception(Constants.noBooks)));
      }
    } catch (e) {
      emit(BooksLoadFailure(exception: Exception('${Constants.failedLoading}' '$e')));
    }
  }
}
