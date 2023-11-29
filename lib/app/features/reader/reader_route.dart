import 'package:ebooks_reader/app/features/reader/reader_page.dart';
import 'package:ebooks_reader/app/models/book_model.dart';
import 'package:flutter/material.dart';

class ReaderRoute {
  Widget page(BuildContext context) {
    final settings = ModalRoute.of(context)?.settings.arguments as BookModel;
    return ReaderPage(
      book: settings,
    );
  }
}
