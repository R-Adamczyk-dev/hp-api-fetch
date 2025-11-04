import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:hp_api_fetch/data/models/book.dart';

class BookTile extends StatelessWidget {
  final Book book;
  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: GFAvatar(
        backgroundImage: NetworkImage(book.cover),
        shape: GFAvatarShape.square,
      ),
      title: Text(book.title),
      children: [
        Text(book.description),
        Text(book.releaseDate),
      ],
    );
  }
}
