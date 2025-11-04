import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hp_api_fetch/commons/blocs/books/books_bloc.dart';
import 'package:hp_api_fetch/data/models/book.dart';
import 'package:hp_api_fetch/screens/home/widgets/appbar.dart';
import 'package:hp_api_fetch/screens/home/widgets/book_tile.dart';
import 'package:hp_api_fetch/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          if (state is BooksLoadSuccess) {
            final List<Book> fetchedBooks = state.books;
            final booksList = fetchedBooks.map((e) => BookTile(book: e)).toList();
            return Center(
              child: Column(
                children: booksList,
              ),
            );
          } else if (state is BooksLoadInProgress) {
            return const GFLoader();
          } else {
            return const GFCard(
              title: GFListTile(
                titleText: Constants.noBooks,
              ),
            );
          }
        },
      ),
    );
  }
}
