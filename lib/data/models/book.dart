import 'dart:convert';

import 'package:equatable/equatable.dart';

Book characterFromJson(String str) => Book.fromJson(json.decode(str));

String characterToJson(Book data) => json.encode(data.toJson());

class Book extends Equatable {
  final int number;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final int pages;
  final String cover;
  final int index;

  const Book({
    required this.number,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.cover,
    required this.index,
  });

  Book copyWith({
    int? number,
    String? title,
    String? originalTitle,
    String? releaseDate,
    String? description,
    int? pages,
    String? cover,
    int? index,
  }) =>
      Book(
        number: number ?? this.number,
        title: title ?? this.title,
        originalTitle: originalTitle ?? this.originalTitle,
        releaseDate: releaseDate ?? this.releaseDate,
        description: description ?? this.description,
        pages: pages ?? this.pages,
        cover: cover ?? this.cover,
        index: index ?? this.index,
      );

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        number: json["number"],
        title: json["title"],
        originalTitle: json["originalTitle"],
        releaseDate: json["releaseDate"],
        description: json["description"],
        pages: json["pages"],
        cover: json["cover"],
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "title": title,
        "originalTitle": originalTitle,
        "releaseDate": releaseDate,
        "description": description,
        "pages": pages,
        "cover": cover,
        "index": index,
      };

  @override
  List<Object?> get props => [
        number,
        title,
        originalTitle,
        releaseDate,
        description,
        pages,
        cover,
        index,
      ];
}
