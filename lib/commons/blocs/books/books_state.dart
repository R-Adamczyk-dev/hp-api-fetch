part of 'books_bloc.dart';

sealed class BooksState extends Equatable {
  const BooksState({this.books = const []});
  final List<Book> books;

  @override
  List<Object?> get props => [books];
}

final class BooksInitial extends BooksState {
  const BooksInitial();
}

final class BooksLoadInProgress extends BooksState {
  const BooksLoadInProgress();
}

final class BooksLoadSuccess extends BooksState {
  const BooksLoadSuccess(List<Book> books) : super(books: books);
}

final class BooksLoadFailure extends BooksState {
  const BooksLoadFailure({required this.exception});
  final Exception exception;
}
