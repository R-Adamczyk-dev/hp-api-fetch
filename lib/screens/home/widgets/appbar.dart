import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:hp_api_fetch/commons/blocs/books/books_bloc.dart';
import 'package:hp_api_fetch/utils/constants.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  State<MyAppbar> createState() => _MyAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppbarState extends State<MyAppbar> {
  final TextEditingController _searchController = TextEditingController();
  String query = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      query = _searchController.text;
      context.read<BooksBloc>().add(BooksSearchEvent(query: query));
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GFAppBar(
      searchController: _searchController,
      searchBar: true,
      backgroundColor: Colors.amber,
      title: const Center(
        child: Text(
          Constants.appBarTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
