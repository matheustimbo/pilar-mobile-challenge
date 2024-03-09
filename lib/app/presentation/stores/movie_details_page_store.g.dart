// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieDetailsPageStore on _MovieDetailsPageStoreBase, Store {
  late final _$moviePosterPredominantColorAtom = Atom(
      name: '_MovieDetailsPageStoreBase.moviePosterPredominantColor',
      context: context);

  @override
  Color? get moviePosterPredominantColor {
    _$moviePosterPredominantColorAtom.reportRead();
    return super.moviePosterPredominantColor;
  }

  @override
  set moviePosterPredominantColor(Color? value) {
    _$moviePosterPredominantColorAtom
        .reportWrite(value, super.moviePosterPredominantColor, () {
      super.moviePosterPredominantColor = value;
    });
  }

  late final _$isLoadingMovieDetailsAtom = Atom(
      name: '_MovieDetailsPageStoreBase.isLoadingMovieDetails',
      context: context);

  @override
  bool get isLoadingMovieDetails {
    _$isLoadingMovieDetailsAtom.reportRead();
    return super.isLoadingMovieDetails;
  }

  @override
  set isLoadingMovieDetails(bool value) {
    _$isLoadingMovieDetailsAtom.reportWrite(value, super.isLoadingMovieDetails,
        () {
      super.isLoadingMovieDetails = value;
    });
  }

  late final _$movieDetailsAtom =
      Atom(name: '_MovieDetailsPageStoreBase.movieDetails', context: context);

  @override
  MovieDetails? get movieDetails {
    _$movieDetailsAtom.reportRead();
    return super.movieDetails;
  }

  @override
  set movieDetails(MovieDetails? value) {
    _$movieDetailsAtom.reportWrite(value, super.movieDetails, () {
      super.movieDetails = value;
    });
  }

  late final _$hasErrorLoadingMovieDetailsAtom = Atom(
      name: '_MovieDetailsPageStoreBase.hasErrorLoadingMovieDetails',
      context: context);

  @override
  bool get hasErrorLoadingMovieDetails {
    _$hasErrorLoadingMovieDetailsAtom.reportRead();
    return super.hasErrorLoadingMovieDetails;
  }

  @override
  set hasErrorLoadingMovieDetails(bool value) {
    _$hasErrorLoadingMovieDetailsAtom
        .reportWrite(value, super.hasErrorLoadingMovieDetails, () {
      super.hasErrorLoadingMovieDetails = value;
    });
  }

  late final _$isLoadingMovieCreditsAtom = Atom(
      name: '_MovieDetailsPageStoreBase.isLoadingMovieCredits',
      context: context);

  @override
  bool get isLoadingMovieCredits {
    _$isLoadingMovieCreditsAtom.reportRead();
    return super.isLoadingMovieCredits;
  }

  @override
  set isLoadingMovieCredits(bool value) {
    _$isLoadingMovieCreditsAtom.reportWrite(value, super.isLoadingMovieCredits,
        () {
      super.isLoadingMovieCredits = value;
    });
  }

  late final _$movieCreditsAtom =
      Atom(name: '_MovieDetailsPageStoreBase.movieCredits', context: context);

  @override
  MovieCredits? get movieCredits {
    _$movieCreditsAtom.reportRead();
    return super.movieCredits;
  }

  @override
  set movieCredits(MovieCredits? value) {
    _$movieCreditsAtom.reportWrite(value, super.movieCredits, () {
      super.movieCredits = value;
    });
  }

  late final _$hasErrorLoadingMovieCreditsAtom = Atom(
      name: '_MovieDetailsPageStoreBase.hasErrorLoadingMovieCredits',
      context: context);

  @override
  bool get hasErrorLoadingMovieCredits {
    _$hasErrorLoadingMovieCreditsAtom.reportRead();
    return super.hasErrorLoadingMovieCredits;
  }

  @override
  set hasErrorLoadingMovieCredits(bool value) {
    _$hasErrorLoadingMovieCreditsAtom
        .reportWrite(value, super.hasErrorLoadingMovieCredits, () {
      super.hasErrorLoadingMovieCredits = value;
    });
  }

  late final _$_MovieDetailsPageStoreBaseActionController =
      ActionController(name: '_MovieDetailsPageStoreBase', context: context);

  @override
  void setMoviePredominantColor(Color? color) {
    final _$actionInfo =
        _$_MovieDetailsPageStoreBaseActionController.startAction(
            name: '_MovieDetailsPageStoreBase.setMoviePredominantColor');
    try {
      return super.setMoviePredominantColor(color);
    } finally {
      _$_MovieDetailsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoadingMovieDetails(bool value) {
    final _$actionInfo =
        _$_MovieDetailsPageStoreBaseActionController.startAction(
            name: '_MovieDetailsPageStoreBase.setIsLoadingMovieDetails');
    try {
      return super.setIsLoadingMovieDetails(value);
    } finally {
      _$_MovieDetailsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovieDetails(MovieDetails? movieDetails) {
    final _$actionInfo = _$_MovieDetailsPageStoreBaseActionController
        .startAction(name: '_MovieDetailsPageStoreBase.setMovieDetails');
    try {
      return super.setMovieDetails(movieDetails);
    } finally {
      _$_MovieDetailsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasErrorLoadingMovieDetails(bool value) {
    final _$actionInfo =
        _$_MovieDetailsPageStoreBaseActionController.startAction(
            name: '_MovieDetailsPageStoreBase.setHasErrorLoadingMovieDetails');
    try {
      return super.setHasErrorLoadingMovieDetails(value);
    } finally {
      _$_MovieDetailsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoadingMovieCredits(bool value) {
    final _$actionInfo =
        _$_MovieDetailsPageStoreBaseActionController.startAction(
            name: '_MovieDetailsPageStoreBase.setIsLoadingMovieCredits');
    try {
      return super.setIsLoadingMovieCredits(value);
    } finally {
      _$_MovieDetailsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovieCredits(MovieCredits? movieCredits) {
    final _$actionInfo = _$_MovieDetailsPageStoreBaseActionController
        .startAction(name: '_MovieDetailsPageStoreBase.setMovieCredits');
    try {
      return super.setMovieCredits(movieCredits);
    } finally {
      _$_MovieDetailsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasErrorLoadingMovieCredits(bool value) {
    final _$actionInfo =
        _$_MovieDetailsPageStoreBaseActionController.startAction(
            name: '_MovieDetailsPageStoreBase.setHasErrorLoadingMovieCredits');
    try {
      return super.setHasErrorLoadingMovieCredits(value);
    } finally {
      _$_MovieDetailsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moviePosterPredominantColor: ${moviePosterPredominantColor},
isLoadingMovieDetails: ${isLoadingMovieDetails},
movieDetails: ${movieDetails},
hasErrorLoadingMovieDetails: ${hasErrorLoadingMovieDetails},
isLoadingMovieCredits: ${isLoadingMovieCredits},
movieCredits: ${movieCredits},
hasErrorLoadingMovieCredits: ${hasErrorLoadingMovieCredits}
    ''';
  }
}
