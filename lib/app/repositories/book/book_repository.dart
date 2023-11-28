import 'package:ebooks_reader/app/models/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getAllBooks();
}
