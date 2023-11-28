// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$_bookListAtom =
      Atom(name: 'HomeControllerBase._bookList', context: context);

  List<BookModel> get bookList {
    _$_bookListAtom.reportRead();
    return super._bookList;
  }

  @override
  List<BookModel> get _bookList => bookList;

  @override
  set _bookList(List<BookModel> value) {
    _$_bookListAtom.reportWrite(value, super._bookList, () {
      super._bookList = value;
    });
  }

  late final _$_bookFavoriteListAtom =
      Atom(name: 'HomeControllerBase._bookFavoriteList', context: context);

  List<String> get bookFavoriteList {
    _$_bookFavoriteListAtom.reportRead();
    return super._bookFavoriteList;
  }

  @override
  List<String> get _bookFavoriteList => bookFavoriteList;

  @override
  set _bookFavoriteList(List<String> value) {
    _$_bookFavoriteListAtom.reportWrite(value, super._bookFavoriteList, () {
      super._bookFavoriteList = value;
    });
  }

  late final _$getAllBooksAsyncAction =
      AsyncAction('HomeControllerBase.getAllBooks', context: context);

  @override
  Future<void> getAllBooks() {
    return _$getAllBooksAsyncAction.run(() => super.getAllBooks());
  }

  late final _$addBookFavoriteAsyncAction =
      AsyncAction('HomeControllerBase.addBookFavorite', context: context);

  @override
  Future<void> addBookFavorite(BookModel book) {
    return _$addBookFavoriteAsyncAction.run(() => super.addBookFavorite(book));
  }

  late final _$getBookFavoriteAsyncAction =
      AsyncAction('HomeControllerBase.getBookFavorite', context: context);

  @override
  Future<void> getBookFavorite() {
    return _$getBookFavoriteAsyncAction.run(() => super.getBookFavorite());
  }

  late final _$removeBookFavoriteAsyncAction =
      AsyncAction('HomeControllerBase.removeBookFavorite', context: context);

  @override
  Future<void> removeBookFavorite(BookModel book) {
    return _$removeBookFavoriteAsyncAction
        .run(() => super.removeBookFavorite(book));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
