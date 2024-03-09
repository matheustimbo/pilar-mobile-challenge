import 'package:flutter_test/flutter_test.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_page_store.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_store.dart';

void main() {
  late MovieListPageStore movieListPageStore;

  setUpAll(() {
    movieListPageStore = MovieListPageStore();
  });

  group('MovieListPageStore', () {
    test('has correct default values', () {
      expect(movieListPageStore.nowPlayingMovies, isA<MovieListStore>());
      expect(movieListPageStore.topRatedMovies, isA<MovieListStore>());
      expect(movieListPageStore.popularMovies, isA<MovieListStore>());
    });
  });
}
