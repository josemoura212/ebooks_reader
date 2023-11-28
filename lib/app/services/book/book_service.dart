import 'package:ebooks_reader/app/models/book_model.dart';

abstract class BookService {
  Future<List<BookModel>> getAllBooks();
}
