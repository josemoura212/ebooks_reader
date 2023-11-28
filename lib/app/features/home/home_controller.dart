import 'package:ebooks_reader/app/core/ui/widgets/loader.dart';
import 'package:ebooks_reader/app/models/book_model.dart';
import 'package:ebooks_reader/app/services/book/book_service_impl.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

enum HomeType { books, favorites }

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final _bookService = BookServiceImpl();
  @readonly
  var _bookList = <BookModel>[];
  var _bookListCache = <BookModel>[];

  @readonly
  var _nameSearchText = "";

  @readonly
  var _homeTypeSelected = HomeType.books;

  @readonly
  var _bookFavoriteList = <BookModel>[];

  @action
  Future<void> getAllBooks() async {
    try {
      Loader.show();
      final bookResult = await _bookService.getAllBooks();
      final bookfilter = bookResult.map<BookModel>((book) {
        if (_bookFavoriteList.contains(book)) {
          book.favorite = true;
        } else {
          book.favorite = false;
        }
        return book;
      }).toList();
      _bookList = [...bookfilter];
      _bookListCache = [...bookfilter];
    } finally {
      Loader.hide();
    }
  }

  @action
  Future<void> checkBookFavorite(BookModel book, int index) async {
    _bookList[index].favorite = !book.favorite;
    _bookList = [..._bookList];
    if (_bookFavoriteList.contains(book)) {
      await removeBookFavorite(book);
    } else {
      await addBookFavorite(book);
    }
  }

  @action
  Future<void> addBookFavorite(BookModel book) async {
    _bookFavoriteList.add(book);
    await _bookService.addFavoriteBook(book);
    _bookFavoriteList = [..._bookFavoriteList];
    filterBook();
  }

  @action
  Future<void> getBookFavorite() async {
    final books = await _bookService.getFavoritesBooks();
    _bookFavoriteList = [...books];
  }

  @action
  Future<void> removeBookFavorite(BookModel book) async {
    _bookFavoriteList.remove(book);
    await _bookService.removeFovoriteBook(book);
    _bookFavoriteList = [..._bookFavoriteList];
    filterBook();
  }

  @action
  void selectType(HomeType type) {
    _homeTypeSelected = type;
    filterBook();
  }

  @action
  void filterBookByName(String name) {
    _nameSearchText = name;
    filterBook();
  }

  @action
  void filterBook() {
    var books = [..._bookListCache];

    if (_nameSearchText.isNotEmpty) {
      books = _bookList
          .where((book) =>
              book.title.toLowerCase().contains(_nameSearchText.toLowerCase()))
          .toList();
    }

    if (_homeTypeSelected == HomeType.favorites) {
      books = _bookList.where((book) => book.favorite == true).toList();
    }
    _bookList = [...books];
  }
}
