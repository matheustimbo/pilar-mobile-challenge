// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieListStore on _MovieListStoreBase, Store {
  late final _$isLoadingInitialMovieListAtom = Atom(
      name: '_MovieListStoreBase.isLoadingInitialMovieList', context: context);

  @override
  bool get isLoadingInitialMovieList {
    _$isLoadingInitialMovieListAtom.reportRead();
    return super.isLoadingInitialMovieList;
  }

  @override
  set isLoadingInitialMovieList(bool value) {
    _$isLoadingInitialMovieListAtom
        .reportWrite(value, super.isLoadingInitialMovieList, () {
      super.isLoadingInitialMovieList = value;
    });
  }

  late final _$hasErrorLoadingInitialMovieListAtom = Atom(
      name: '_MovieListStoreBase.hasErrorLoadingInitialMovieList',
      context: context);

  @override
  bool get hasErrorLoadingInitialMovieList {
    _$hasErrorLoadingInitialMovieListAtom.reportRead();
    return super.hasErrorLoadingInitialMovieList;
  }

  @override
  set hasErrorLoadingInitialMovieList(bool value) {
    _$hasErrorLoadingInitialMovieListAtom
        .reportWrite(value, super.hasErrorLoadingInitialMovieList, () {
      super.hasErrorLoadingInitialMovieList = value;
    });
  }

  late final _$movieListAtom =
      Atom(name: '_MovieListStoreBase.movieList', context: context);

  @override
  List<MovieListItem> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(List<MovieListItem> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  late final _$lastFetchedPageAtom =
      Atom(name: '_MovieListStoreBase.lastFetchedPage', context: context);

  @override
  int? get lastFetchedPage {
    _$lastFetchedPageAtom.reportRead();
    return super.lastFetchedPage;
  }

  @override
  set lastFetchedPage(int? value) {
    _$lastFetchedPageAtom.reportWrite(value, super.lastFetchedPage, () {
      super.lastFetchedPage = value;
    });
  }

  late final _$totalPagesAtom =
      Atom(name: '_MovieListStoreBase.totalPages', context: context);

  @override
  int? get totalPages {
    _$totalPagesAtom.reportRead();
    return super.totalPages;
  }

  @override
  set totalPages(int? value) {
    _$totalPagesAtom.reportWrite(value, super.totalPages, () {
      super.totalPages = value;
    });
  }

  late final _$isLoadingMoreMoviesAtom =
      Atom(name: '_MovieListStoreBase.isLoadingMoreMovies', context: context);

  @override
  bool get isLoadingMoreMovies {
    _$isLoadingMoreMoviesAtom.reportRead();
    return super.isLoadingMoreMovies;
  }

  @override
  set isLoadingMoreMovies(bool value) {
    _$isLoadingMoreMoviesAtom.reportWrite(value, super.isLoadingMoreMovies, () {
      super.isLoadingMoreMovies = value;
    });
  }

  late final _$_MovieListStoreBaseActionController =
      ActionController(name: '_MovieListStoreBase', context: context);

  @override
  void setIsLoadingInitialMovieList(bool b) {
    final _$actionInfo = _$_MovieListStoreBaseActionController.startAction(
        name: '_MovieListStoreBase.setIsLoadingInitialMovieList');
    try {
      return super.setIsLoadingInitialMovieList(b);
    } finally {
      _$_MovieListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasErrorLoadingInitialMovieList(bool b) {
    final _$actionInfo = _$_MovieListStoreBaseActionController.startAction(
        name: '_MovieListStoreBase.setHasErrorLoadingInitialMovieList');
    try {
      return super.setHasErrorLoadingInitialMovieList(b);
    } finally {
      _$_MovieListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovies(List<MovieListItem> movies) {
    final _$actionInfo = _$_MovieListStoreBaseActionController.startAction(
        name: '_MovieListStoreBase.setMovies');
    try {
      return super.setMovies(movies);
    } finally {
      _$_MovieListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastFetchedPage(int? page) {
    final _$actionInfo = _$_MovieListStoreBaseActionController.startAction(
        name: '_MovieListStoreBase.setLastFetchedPage');
    try {
      return super.setLastFetchedPage(page);
    } finally {
      _$_MovieListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalPages(int? t) {
    final _$actionInfo = _$_MovieListStoreBaseActionController.startAction(
        name: '_MovieListStoreBase.setTotalPages');
    try {
      return super.setTotalPages(t);
    } finally {
      _$_MovieListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoadingMoreMovies(bool b) {
    final _$actionInfo = _$_MovieListStoreBaseActionController.startAction(
        name: '_MovieListStoreBase.setIsLoadingMoreMovies');
    try {
      return super.setIsLoadingMoreMovies(b);
    } finally {
      _$_MovieListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_MovieListStoreBaseActionController.startAction(
        name: '_MovieListStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_MovieListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingInitialMovieList: ${isLoadingInitialMovieList},
hasErrorLoadingInitialMovieList: ${hasErrorLoadingInitialMovieList},
movieList: ${movieList},
lastFetchedPage: ${lastFetchedPage},
totalPages: ${totalPages},
isLoadingMoreMovies: ${isLoadingMoreMovies}
    ''';
  }
}
