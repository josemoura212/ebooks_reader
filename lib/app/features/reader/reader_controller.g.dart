// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReaderController on ReaderControllerBase, Store {
  late final _$_loadingAtom =
      Atom(name: 'ReaderControllerBase._loading', context: context);

  bool get loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  bool get _loading => loading;

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_pathAtom =
      Atom(name: 'ReaderControllerBase._path', context: context);

  String get path {
    _$_pathAtom.reportRead();
    return super._path;
  }

  @override
  String get _path => path;

  @override
  set _path(String value) {
    _$_pathAtom.reportWrite(value, super._path, () {
      super._path = value;
    });
  }

  late final _$downloadAsyncAction =
      AsyncAction('ReaderControllerBase.download', context: context);

  @override
  Future<void> download(String urlPath, String name) {
    return _$downloadAsyncAction.run(() => super.download(urlPath, name));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
