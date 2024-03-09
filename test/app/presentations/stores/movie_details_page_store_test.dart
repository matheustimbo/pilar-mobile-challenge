import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_details_page_store.dart';

void main() {
  late MovieDetailsPageStore movieDetailsPageStore;

  setUpAll(() {
    movieDetailsPageStore = MovieDetailsPageStore();
  });

  final exampleMovieDetails = MovieDetails(
    id: 1,
    genres: [],
    runtime: 120,
    tagline: '',
    title: 'Title 1',
    adult: false,
    vote_average: 10,
    poster_path: '',
    release_date: DateTime.now(),
    overview: '',
    backdrop_path: '',
  );

  final exampleMovieCredits = MovieCredits(
    id: 1,
    cast: [],
  );

  group('MovieDetailsPageStore', () {
    test('has correct default values', () {
      expect(movieDetailsPageStore.movieDetails, null);
      expect(movieDetailsPageStore.isLoadingMovieDetails, false);
      expect(movieDetailsPageStore.hasErrorLoadingMovieDetails, false);
      expect(movieDetailsPageStore.moviePosterPredominantColor, null);
      expect(movieDetailsPageStore.isLoadingMovieCredits, false);
      expect(movieDetailsPageStore.hasErrorLoadingMovieCredits, false);
      expect(movieDetailsPageStore.movieCredits, null);
    });

    test('setMovieDetails', () {
      movieDetailsPageStore.setMovieDetails(exampleMovieDetails);
      expect(movieDetailsPageStore.movieDetails, exampleMovieDetails);
    });

    test('setIsLoadingMovieDetails', () {
      movieDetailsPageStore.setIsLoadingMovieDetails(true);
      expect(movieDetailsPageStore.isLoadingMovieDetails, true);
    });

    test('setHasErrorLoadingMovieDetails', () {
      movieDetailsPageStore.setHasErrorLoadingMovieDetails(true);
      expect(movieDetailsPageStore.hasErrorLoadingMovieDetails, true);
    });

    test('setMoviePredominantColor', () {
      movieDetailsPageStore.setMoviePredominantColor(Colors.black);
      expect(movieDetailsPageStore.moviePosterPredominantColor, Colors.black);
    });

    test('setIsLoadingMovieCredits', () {
      movieDetailsPageStore.setIsLoadingMovieCredits(true);
      expect(movieDetailsPageStore.isLoadingMovieCredits, true);
    });

    test('setHasErrorLoadingMovieCredits', () {
      movieDetailsPageStore.setHasErrorLoadingMovieCredits(true);
      expect(movieDetailsPageStore.hasErrorLoadingMovieCredits, true);
    });

    test('setMovieCredits', () {
      movieDetailsPageStore.setMovieCredits(exampleMovieCredits);
      expect(movieDetailsPageStore.movieCredits, exampleMovieCredits);
    });
  });
}
