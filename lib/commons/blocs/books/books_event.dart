part of 'books_bloc.dart';

@immutable
sealed class BooksEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class BooksFetchEvent extends BooksEvent {}

final class BooksSearchEvent extends BooksEvent {
  final String query;

  BooksSearchEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
