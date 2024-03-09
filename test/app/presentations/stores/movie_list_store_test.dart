import 'package:flutter_test/flutter_test.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_store.dart';

void main() {
  late MovieListStore movieListStore;

  setUpAll(() {
    movieListStore = MovieListStore();
  });

  group('MovieListStore', () {
    test('has correct default values', () {
      expect(movieListStore.isLoadingInitialMovieList, false);
      expect(movieListStore.hasErrorLoadingInitialMovieList, false);
      expect(movieListStore.movieList, []);
      expect(movieListStore.lastFetchedPage, null);
      expect(movieListStore.totalPages, null);
      expect(movieListStore.isLoadingMoreMovies, false);
    });

    test('setIsLoadingInitialMovieList', () {
      movieListStore.setIsLoadingInitialMovieList(true);
      expect(movieListStore.isLoadingInitialMovieList, true);
    });

    test('setHasErrorLoadingInitialMovieList', () {
      movieListStore.setHasErrorLoadingInitialMovieList(true);
      expect(movieListStore.hasErrorLoadingInitialMovieList, true);
    });

    test('setMovies', () {
      final movies = [
        MovieListItem(
          id: 1,
          title: 'Title 1',
          adult: false,
          vote_average: 10,
          poster_path: '',
          release_date: DateTime.now(),
          overview: '',
          backdrop_path: '',
        ),
        MovieListItem(
          id: 2,
          title: 'Title 2',
          adult: false,
          vote_average: 10,
          poster_path: '',
          release_date: DateTime.now(),
          overview: '',
          backdrop_path: '',
        ),
      ];
      movieListStore.setMovies(movies);
      expect(movieListStore.movieList, movies);
    });

    test('setLastFetchedPage', () {
      movieListStore.setLastFetchedPage(1);
      expect(movieListStore.lastFetchedPage, 1);
    });

    test('setTotalPages', () {
      movieListStore.setTotalPages(10);
      expect(movieListStore.totalPages, 10);
    });

    test('setIsLoadingMoreMovies', () {
      movieListStore.setIsLoadingMoreMovies(true);
      expect(movieListStore.isLoadingMoreMovies, true);
    });

    test('reset should return values to default', () {
      movieListStore.setIsLoadingInitialMovieList(true);
      movieListStore.setHasErrorLoadingInitialMovieList(true);
      movieListStore.setMovies([
        MovieListItem(
            id: 1,
            title: 'Title 1',
            adult: false,
            vote_average: 10,
            poster_path: '',
            release_date: DateTime.now(),
            overview: '',
            backdrop_path: ''),
      ]);
      movieListStore.setLastFetchedPage(1);
      movieListStore.setTotalPages(10);
      movieListStore.setIsLoadingMoreMovies(true);

      movieListStore.reset();

      expect(movieListStore.isLoadingInitialMovieList, false);
      expect(movieListStore.hasErrorLoadingInitialMovieList, false);
      expect(movieListStore.movieList, []);
      expect(movieListStore.lastFetchedPage, null);
      expect(movieListStore.totalPages, null);
      expect(movieListStore.isLoadingMoreMovies, false);
    });
  });
}
