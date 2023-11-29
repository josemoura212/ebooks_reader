import 'dart:io';
import 'package:ebooks_reader/app/core/exceptions/failure_exception.dart';
import 'package:ebooks_reader/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:ebooks_reader/app/core/rest_client/rest_client_exception.dart';
import 'package:path_provider/path_provider.dart';

import './reader_repository.dart';

class ReaderRepositoryImpl implements ReaderRepository {
  final _restClient = DioRestClient();
  @override
  Future<String> downloadEpub(
    String urlPath,
    String name,
  ) async {
    try {
      Directory? appDocDir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      String path = appDocDir!.path + name;
      File file = File(path);

      if (!File(path).existsSync()) {
        await file.create();
        await _restClient.download(urlPath, path);
        return path;
      } else {
        return path;
      }
    } on RestClientException catch (e, s) {
      throw FailureException(
          message: "Erro ao baixar epub error: $e, stackTrace: $s");
    }
  }
}
