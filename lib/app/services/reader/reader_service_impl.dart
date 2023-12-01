import 'dart:io';

import 'package:ebooks_reader/app/repositories/reader/reader_repository_impl.dart';
import 'package:path_provider/path_provider.dart';

import './reader_service.dart';

class ReaderServiceImpl implements ReaderService {
  final _readerRepository = ReaderRepositoryImpl();
  @override
  Future<String> downloadEpub(String urlPath, String name) async {
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    String path = appDocDir!.path + name;
    File file = File(path);

    if (!File(path).existsSync()) {
      await file.create();
      await _readerRepository.downloadEpub(urlPath, path);
      return path;
    } else {
      return path;
    }
  }
}
