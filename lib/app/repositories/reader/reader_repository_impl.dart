import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ebooks_reader/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:path_provider/path_provider.dart';

import './reader_repository.dart';

class ReaderRepositoryImpl implements ReaderRepository {
  final _restClient = DioRestClient();
  @override
  Future<void> downloadEpub(String urlPath, String savePath) async {
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    final response = await _restClient.download(urlPath, savePath);
  }

  Future<Directory?> getExternalStorageDirectory() async {
    final String? path = await _platform.getExternalStoragePath();
    if (path == null) {
      return null;
    }
    return Directory(path);
  }
}
