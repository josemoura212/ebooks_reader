import 'package:ebooks_reader/app/services/reader/reader_service_impl.dart';
import 'package:mobx/mobx.dart';
part 'reader_controller.g.dart';

class ReaderController = ReaderControllerBase with _$ReaderController;

abstract class ReaderControllerBase with Store {
  final _readerService = ReaderServiceImpl();

  @readonly
  var _loading = false;

  @readonly
  String _path = "";

  @action
  Future<void> download(
    String urlPath,
    String name,
  ) async {
    try {
      _loading = true;
      name = "$name.epub";
      _path = await _readerService.downloadEpub(urlPath, name);
    } finally {
      _loading = false;
    }
  }
}
