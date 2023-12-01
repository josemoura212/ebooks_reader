import 'package:ebooks_reader/app/core/exceptions/failure_exception.dart';
import 'package:ebooks_reader/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:ebooks_reader/app/core/rest_client/rest_client_exception.dart';

import './reader_repository.dart';

class ReaderRepositoryImpl implements ReaderRepository {
  final _restClient = DioRestClient();
  @override
  Future<void> downloadEpub(
    String urlPath,
    String path,
  ) async {
    try {
      await _restClient.download(urlPath, path);
    } on RestClientException catch (e, s) {
      throw FailureException(
          message: "Erro ao baixar epub error: $e, stackTrace: $s");
    }
  }
}
