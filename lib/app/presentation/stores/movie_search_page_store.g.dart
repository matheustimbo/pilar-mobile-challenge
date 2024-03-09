// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieSearchPageStore on _MovieSearchPageStoreBase, Store {
  late final _$searchQueryAtom =
      Atom(name: '_MovieSearchPageStoreBase.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$_MovieSearchPageStoreBaseActionController =
      ActionController(name: '_MovieSearchPageStoreBase', context: context);

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_MovieSearchPageStoreBaseActionController
        .startAction(name: '_MovieSearchPageStoreBase.setSearchQuery');
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_MovieSearchPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery}
    ''';
  }
}
