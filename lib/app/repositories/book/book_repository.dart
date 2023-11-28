import 'package:ebooks_reader/app/models/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getAllBooks();
  Future<List<BookModel>> getFavoritesBooks();
  Future<void> addFavoriteBook(BookModel book);
  Future<void> removeFovoriteBook(BookModel book);
}
