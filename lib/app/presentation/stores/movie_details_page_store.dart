import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';

part 'movie_details_page_store.g.dart';

class MovieDetailsPageStore = _MovieDetailsPageStoreBase
    with _$MovieDetailsPageStore;

abstract class _MovieDetailsPageStoreBase with Store {
  @observable
  Color? moviePosterPredominantColor;

  @action
  void setMoviePredominantColor(Color? color) =>
      moviePosterPredominantColor = color;

  @observable
  bool isLoadingMovieDetails = false;

  @action
  void setIsLoadingMovieDetails(bool value) => isLoadingMovieDetails = value;

  @observable
  MovieDetails? movieDetails;

  @action
  void setMovieDetails(MovieDetails? movieDetails) =>
      this.movieDetails = movieDetails;

  @observable
  bool hasErrorLoadingMovieDetails = false;

  @action
  void setHasErrorLoadingMovieDetails(bool value) =>
      hasErrorLoadingMovieDetails = value;

  @observable
  bool isLoadingMovieCredits = false;

  @action
  void setIsLoadingMovieCredits(bool value) => isLoadingMovieCredits = value;

  @observable
  MovieCredits? movieCredits;

  @action
  void setMovieCredits(MovieCredits? movieCredits) =>
      this.movieCredits = movieCredits;

  @observable
  bool hasErrorLoadingMovieCredits = false;

  @action
  void setHasErrorLoadingMovieCredits(bool value) =>
      hasErrorLoadingMovieCredits = value;
}
