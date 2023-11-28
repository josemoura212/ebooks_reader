import 'package:ebooks_reader/app/core/exceptions/failure_exception.dart';
import 'package:ebooks_reader/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:ebooks_reader/app/core/rest_client/rest_client_exception.dart';
import 'package:ebooks_reader/app/models/book_model.dart';

import './book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final _restClient = DioRestClient();

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
}
