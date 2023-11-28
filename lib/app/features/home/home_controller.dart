import 'package:ebooks_reader/app/core/helpers/constants.dart';
import 'package:ebooks_reader/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:ebooks_reader/app/core/ui/widgets/loader.dart';
import 'package:ebooks_reader/app/models/book_model.dart';
import 'package:ebooks_reader/app/services/book/book_service_impl.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final _bookService = BookServiceImpl();
  final _localStorage = SharedPreferencesLocalStorageImpl();
  @readonly
  var _bookList = <BookModel>[];

  @readonly
  var _bookFavoriteList = <String>[];

  @action
  Future<void> getAllBooks() async {
    try {
      Loader.show();
      _bookList.clear();
      _bookList = await _bookService.getAllBooks();
    } finally {
      Loader.hide();
    }
  }

  @action
  Future<void> addBookFavorite(BookModel book) async {
    _bookFavoriteList.add(book.id.toString());
    await _localStorage.write<List<String>>(
        Constants.BOOK_LOCAL_STORAGE_KEY, _bookFavoriteList);
  }

  @action
  Future<void> getBookFavorite() async {
    _bookFavoriteList.clear();
    final books = await _localStorage
        .read<List<String>>(Constants.BOOK_LOCAL_STORAGE_KEY);
    if (books != null) {
      _bookFavoriteList = books;
    }
  }

  @action
  Future<void> removeBookFavorite(BookModel book) async {
    _bookFavoriteList.remove(book.id.toString());
    await _localStorage.write<List>(
        Constants.BOOK_LOCAL_STORAGE_KEY, _bookFavoriteList);
  }
}
