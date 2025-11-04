part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}

final class BooksFetchEvent extends BooksEvent {}

final class BooksSearchEvent extends BooksEvent {
  final String query;

  BooksSearchEvent({required this.query});
}
