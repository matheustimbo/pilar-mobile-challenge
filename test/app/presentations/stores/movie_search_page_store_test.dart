import 'package:flutter_test/flutter_test.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_store.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_search_page_store.dart';

void main() {
  late MovieSearchPageStore movieSearchPageStore;

  setUpAll(() {
    movieSearchPageStore = MovieSearchPageStore();
  });

  group('MovieSearchPageStore', () {
    test('has correct default values', () {
      expect(movieSearchPageStore.searchQuery, '');
      expect(movieSearchPageStore.searchMovies, isA<MovieListStore>());
    });

    test('setSearchQuery', () {
      movieSearchPageStore.setSearchQuery('search query');
      expect(movieSearchPageStore.searchQuery, 'search query');
    });
  });
}
