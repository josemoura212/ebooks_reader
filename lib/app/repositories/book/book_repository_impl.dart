import 'package:ebooks_reader/app/core/database/sqlite_connection_factory.dart';
import 'package:ebooks_reader/app/core/exceptions/failure_exception.dart';
import 'package:ebooks_reader/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:ebooks_reader/app/core/rest_client/rest_client_exception.dart';
import 'package:ebooks_reader/app/models/book_model.dart';

import './book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final _restClient = DioRestClient();
  final _sqliteConnectionFactory = SqliteConnectionFactory();

  @override
  Future<List<BookModel>> getAllBooks() async {
    try {
      final result = await _restClient.get("");
      return result.data
          .map<BookModel>((book) => BookModel.fromMap(book))
          .toList();
    } on RestClientException catch (e, s) {
      throw FailureException(
          message: "Erro ao buscar books erro: $e , stackTrace: $s");
    }
  }

  @override
  Future<void> addFavoriteBook(BookModel book) async {
    final conn = await _sqliteConnectionFactory.openConnection();

    await conn.rawInsert(
      "insert into books values(?,?,?,?,?,?)",
      [
        book.id,
        book.title,
        book.author,
        book.coverUrl,
        book.downloadUrl,
        0,
      ],
    );
  }

  @override
  Future<List<BookModel>> getFavoritesBooks() async {
    final conn = await _sqliteConnectionFactory.openConnection();

    final result = await conn.rawQuery("select * from books");
    return result.map<BookModel>((book) => BookModel.fromMap(book)).toList();
  }

  @override
  Future<void> removeFovoriteBook(BookModel book) async {
    final conn = await _sqliteConnectionFactory.openConnection();

    await conn.rawDelete(
      "delete from books where id = ?",
      [book.id],
    );
  }
}
