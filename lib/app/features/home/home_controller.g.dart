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

  late final _$_nameSearchTextAtom =
      Atom(name: 'HomeControllerBase._nameSearchText', context: context);

  String get nameSearchText {
    _$_nameSearchTextAtom.reportRead();
    return super._nameSearchText;
  }

  @override
  String get _nameSearchText => nameSearchText;

  @override
  set _nameSearchText(String value) {
    _$_nameSearchTextAtom.reportWrite(value, super._nameSearchText, () {
      super._nameSearchText = value;
    });
  }

  late final _$_homeTypeSelectedAtom =
      Atom(name: 'HomeControllerBase._homeTypeSelected', context: context);

  HomeType get homeTypeSelected {
    _$_homeTypeSelectedAtom.reportRead();
    return super._homeTypeSelected;
  }

  @override
  HomeType get _homeTypeSelected => homeTypeSelected;

  @override
  set _homeTypeSelected(HomeType value) {
    _$_homeTypeSelectedAtom.reportWrite(value, super._homeTypeSelected, () {
      super._homeTypeSelected = value;
    });
  }

  late final _$_bookFavoriteListAtom =
      Atom(name: 'HomeControllerBase._bookFavoriteList', context: context);

  List<BookModel> get bookFavoriteList {
    _$_bookFavoriteListAtom.reportRead();
    return super._bookFavoriteList;
  }

  @override
  List<BookModel> get _bookFavoriteList => bookFavoriteList;

  @override
  set _bookFavoriteList(List<BookModel> value) {
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

  late final _$checkBookFavoriteAsyncAction =
      AsyncAction('HomeControllerBase.checkBookFavorite', context: context);

  @override
  Future<void> checkBookFavorite(BookModel book, int index) {
    return _$checkBookFavoriteAsyncAction
        .run(() => super.checkBookFavorite(book, index));
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

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void selectType(HomeType type) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.selectType');
    try {
      return super.selectType(type);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterBookByName(String name) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterBookByName');
    try {
      return super.filterBookByName(name);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterBook() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterBook');
    try {
      return super.filterBook();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
